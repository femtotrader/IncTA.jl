const SMA_PERIOD = 3

"""
    SMA{T}(; period = SMA_PERIOD)

The `SMA` type implements a Simple Moving Average indicator.
"""
mutable struct SMA{Tval} <: MovingAverageIndicator{Tval}
    value::Union{Missing,Tval}
    n::Int

    output_listeners::Series

    period::Int

    input_indicator::Union{Missing,TechnicalIndicator}
    input_values::CircBuff{Tval}

    function SMA{Tval}(; period = SMA_PERIOD) where {Tval}
        input_values = CircBuff(Tval, period, rev = false)
        output_listeners = Series()
        input_indicator = missing
        new{Tval}(missing, 0, output_listeners, period, input_indicator, input_values)
    end
end

function _calculate_new_value(ind::SMA)
    values = ind.input_values.value
    return sum(values) / length(values)  # mean(values)
end
