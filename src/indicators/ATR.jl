const ATR_PERIOD = 3

"""
    ATR{Tohlcv}(; period = ATR_PERIOD, input_filter = always_true, input_modifier = identity, input_modifier_return_type = Tohlcv)

The `ATR` type implements an Average True Range indicator.
"""
mutable struct ATR{Tohlcv,IN,S} <: TechnicalIndicatorSingleOutput{Tohlcv}
    value::Union{Missing,S}
    n::Int
    output_listeners::Series
    input_indicator::Union{Missing,TechnicalIndicator}

    period::Number

    tr::CircBuff
    rolling::Bool

    input_modifier::Function
    input_filter::Function
    input_values::CircBuff

    function ATR{Tohlcv}(;
        period = ATR_PERIOD,
        input_filter = always_true,
        input_modifier = identity,
        input_modifier_return_type = Tohlcv,
    ) where {Tohlcv}
        T2 = input_modifier_return_type
        if hasfield(T2, :close)
            S = fieldtype(T2, :close)
        else
            S = Float64
        end
        tr = CircBuff(S, period, rev = false)
        input_values = CircBuff(T2, 2, rev = false)
        new{Tohlcv,true,S}(
            initialize_indicator_common_fields()...,
            period,
            tr,
            false,
            input_modifier,
            input_filter,
            input_values,
        )
    end
end

function _calculate_new_value(ind::ATR)
    candle = ind.input_values[end]
    true_range = candle.high - candle.low

    if has_valid_values(ind.input_values, 1, exact = true)
        fit!(ind.tr, true_range)
    else
        close2 = ind.input_values[end-1].close
        fit!(ind.tr, max(true_range, abs(candle.high - close2), abs(candle.low - close2)))
    end

    if ind.rolling
        return (value(ind) * (ind.period - 1) + ind.tr[end]) / ind.period
    else
        if ind.n == ind.period  # CircBuff is full but not rolling
            ind.rolling = true
            return sum(value(ind.tr)) / ind.period
        else   # CircBuff is filling up
            return missing
        end
    end
end
