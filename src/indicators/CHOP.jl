const CHOP_PERIOD = 14


"""
    CHOP{Tohlcv}(; period = CHOP_PERIOD, input_filter = always_true, input_modifier = identity, input_modifier_return_type = Tohlcv)

The `CHOP` type implements a Choppiness Index indicator.
"""
mutable struct CHOP{Tohlcv,IN,S} <: TechnicalIndicatorSingleOutput{Tohlcv}
    value::Union{Missing,S}
    n::Int
    output_listeners::Series
    input_indicator::Union{Missing,TechnicalIndicator}

    period::Integer

    sub_indicators::Series
    atr::ATR

    atr_values::CircBuff

    input_modifier::Function
    input_filter::Function
    input_values::CircBuff

    function CHOP{Tohlcv}(;
        period = CHOP_PERIOD,
        input_filter = always_true,
        input_modifier = identity,
        input_modifier_return_type = Tohlcv,
    ) where {Tohlcv}
        T2 = input_modifier_return_type
        S = fieldtype(T2, :close)
        atr = ATR{T2}(period = 1)
        sub_indicators = Series(atr)
        atr_values = CircBuff(Union{Missing,S}, period, rev = false)
        input_values = CircBuff(T2, period, rev = false)
        new{Tohlcv,true,S}(
            initialize_indicator_common_fields()...,
            period,
            sub_indicators,
            atr,
            atr_values,
            input_modifier,
            input_filter,
            input_values,
        )
    end
end

function _calculate_new_value(ind::CHOP)
    _atr_value = value(ind.atr)
    fit!(ind.atr_values, _atr_value)

    if !has_valid_values(ind.atr_values, ind.period) ||
       !has_valid_values(ind.input_values, ind.period)
        return missing
    end

    max_high = max((cdl.high for cdl in value(ind.input_values))...)
    min_low = min((cdl.low for cdl in value(ind.input_values))...)

    if max_high != min_low
        return 100 * log10(sum(ind.atr_values.value) / (max_high - min_low)) /
               log10(ind.period)
    else
        if has_output_value(ind)
            return value(ind)
        else
            return missing
        end
    end
end
