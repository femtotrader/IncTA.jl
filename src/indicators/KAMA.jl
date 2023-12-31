const KAMA_PERIOD = 14
const KAMA_FAST_EMA_CONSTANT_PERIOD = 2
const KAMA_SLOW_EMA_CONSTANT_PERIOD = 30

"""
    KAMA{T}(; period = KAMA_PERIOD, fast_ema_constant_period = KAMA_FAST_EMA_CONSTANT_PERIOD, slow_ema_constant_period = KAMA_SLOW_EMA_CONSTANT_PERIOD, input_filter = always_true, input_modifier = identity, input_modifier_return_type = T)

The `KAMA` type implements a Kaufman's Adaptive Moving Average indicator.
"""
mutable struct KAMA{Tval,IN,T2} <: MovingAverageIndicator{Tval}
    value::Union{Missing,T2}
    n::Int
    output_listeners::Series
    input_indicator::Union{Missing,TechnicalIndicator}

    period::Integer

    fast_smoothing_constant::T2
    slow_smoothing_constant::T2

    volatility::CircBuff

    input_modifier::Function
    input_filter::Function
    input_values::CircBuff

    function KAMA{Tval}(;
        period = KAMA_PERIOD,
        fast_ema_constant_period = KAMA_FAST_EMA_CONSTANT_PERIOD,
        slow_ema_constant_period = KAMA_SLOW_EMA_CONSTANT_PERIOD,
        input_filter = always_true,
        input_modifier = identity,
        input_modifier_return_type = Tval,
    ) where {Tval}
        T2 = input_modifier_return_type
        fast_smoothing_constant = 2 * one(T2) / (fast_ema_constant_period + one(T2))
        slow_smoothing_constant = 2 * one(T2) / (slow_ema_constant_period + one(T2))
        volatility = CircBuff(T2, period, rev = false)
        input_values = CircBuff(T2, period + 1, rev = false)
        new{Tval,false,T2}(
            initialize_indicator_common_fields()...,
            period,
            fast_smoothing_constant,
            slow_smoothing_constant,
            volatility,
            input_modifier,
            input_filter,
            input_values,
        )
    end
end

function _calculate_new_value(ind::KAMA)
    if ind.n >= 2
        fit!(ind.volatility, abs(ind.input_values[end] - ind.input_values[end-1]))

        if !has_valid_values(ind.volatility, ind.period)
            return missing
        end

        _volatility = sum(ind.volatility.value)
        change = abs(ind.input_values[end] - ind.input_values[end-ind.period])

        if _volatility != 0
            efficiency_ratio = change / _volatility
        else
            efficiency_ratio = 0
        end

        smoothing_constant =
            (
                efficiency_ratio *
                (ind.fast_smoothing_constant - ind.slow_smoothing_constant) +
                ind.slow_smoothing_constant
            )^2

        if !has_output_value(ind)  # tofix!!!!
            #if length(ind.value) == 0  # tofix!!!!
            prev_kama = ind.input_values[end-1]
        else
            prev_kama = value(ind)
        end

        return prev_kama + smoothing_constant * (ind.input_values[end] - prev_kama)
    else
        return missing
    end

end
