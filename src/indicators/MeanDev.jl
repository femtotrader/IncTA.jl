const MeanDev_PERIOD = 3

"""
    MeanDev{T}(; period = MeanDev_PERIOD, ma = SMA, input_filter = always_true, input_modifier = identity, input_modifier_return_type = T)

The `MeanDev` type implements a Mean Deviation indicator.
"""
mutable struct MeanDev{Tval,T2} <: TechnicalIndicator{Tval}
    value::Union{Missing,T2}
    n::Int

    output_listeners::Series

    period::Integer

    sub_indicators::Series  # field ma needs to be available for CCI calculation
    ma::MovingAverageIndicator  # SMA

    input_modifier::Function
    input_filter::Function
    input_indicator::Union{Missing,TechnicalIndicator}
    input_values::CircBuff

    function MeanDev{Tval}(;
        period = MeanDev_PERIOD,
        ma = SMA,
        input_filter = always_true,
        input_modifier = identity,
        input_modifier_return_type = Tval,
    ) where {Tval}
        T2 = input_modifier_return_type
        input_values = CircBuff(T2, period, rev = false)
        #_ma = SMA{Tval}(period = period)
        _ma = MAFactory(T2)(ma, period = period)
        sub_indicators = Series(_ma)
        output_listeners = Series()
        input_indicator = missing
        new{Tval,T2}(
            missing,
            0,
            output_listeners,
            period,
            sub_indicators,
            _ma,
            input_modifier,
            input_filter,
            input_indicator,
            input_values,
        )
    end
end

function _calculate_new_value(ind::MeanDev)
    _ma = value(ind.ma)
    return sum(abs.(value(ind.input_values) .- _ma)) / ind.period
end
