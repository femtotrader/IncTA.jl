[![Build Status](https://github.com/femtotrader/IncTA.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/femtotrader/IncTA.jl/actions/workflows/CI.yml?query=branch%3Amaster)

# IncTA.jl
This project implements some *Technical Analysis Indicators* in Julia in an incremental approach.

It's inspired by Python project [talipp](https://github.com/nardew/talipp) which is used as "reference implementation" for unit tests.

It depends especially on [OnlineStatsBase.jl](https://github.com/joshday/OnlineStatsBase.jl).

🚧 This software is under construction. API can have breaking changes.

## Package Features
- Calculate new value of some technical analysis indicators when new incoming are received

## Install
Open Julia command line interface. 

Type `] dev https://github.com/femtotrader/IncTA.jl/`

## Usage

See [examples](https://github.com/femtotrader/IncTA.jl/tree/main/examples) and [tests](https://github.com/femtotrader/IncTA.jl/tree/main/test)

IncTA.jl - installing and using it

[![IncTA.jl - installing and using it](http://img.youtube.com/vi/UqHEMi8pCyc/0.jpg)](http://www.youtube.com/watch?v=UqHEMi8pCyc "IncTA.jl - installing and using it")

IncTA.jl - dealing with TSFrames

[![IncTA.jl - dealing with TSFrames](http://img.youtube.com/vi/gmR1QvISiLA/0.jpg)](http://www.youtube.com/watch?v=gmR1QvISiLA "IncTA.jl - dealing with TSFrames")

## Indicators support

| Name | Description | Input | Output | Dependencies | Implementation status |
| --- | --- | --- | --- | --- | --- |
| `AccuDist` | Accumulation and Distribution | :candle: | :1234: | - | :heavy_check_mark:
| `ADX` | Average Directional Index | :candle: | :m: | `ATR` | :heavy_check_mark:
| `ALMA` | Arnaud Legoux Moving Average | :1234: | :1234: | `CircBuff` | :heavy_check_mark:
| `AO` | Awesome Oscillator | :candle: | :1234: | `SMA` | :heavy_check_mark:
| `Aroon` | Aroon Up/Down | :candle: | :m: | `CirBuff` | :heavy_check_mark:
| `ATR` | Average True Range | :candle: | :1234: | `CircBuff` | :heavy_check_mark:
| `BB` | Bollinger Bands | :1234: | :m: | `SMA`, `StdDev` | :heavy_check_mark:
| `BOP` | Balance Of Power | :candle: | :1234: | - | :heavy_check_mark:
| `CCI` | Commodity Channel Index | :candle: | :1234: | `MeanDev` | :heavy_check_mark:
| `ChaikinOsc` | Chaikin Oscillator | :candle: | :1234: | `AccuDist`, `EMA` | :heavy_check_mark:
| `ChandeKrollStop` | Chande Kroll Stop | :candle: | :m: | `CircBuff`, `ATR` | :heavy_check_mark:
| `CHOP` | Choppiness Index | :candle: | :1234: | `CirBuff`, `ATR` | :heavy_check_mark:
| `CoppockCurve` | Coppock Curve | :1234: | :1234: | `ROC`, `WMA` | :heavy_check_mark:
| `DEMA` | Double Exponential Moving Average | :1234: | :1234: | `EMA` | :heavy_check_mark:
| `DonchianChannels` | Donchian Channels | :candle: | :m: | `CircBuff` | :heavy_check_mark:
| `DPO` | Detrended Price Oscillator | :1234: | :1234: | `CircBuff`, `SMA` | :heavy_check_mark:
| `EMA` | Exponential Moving Average | :1234: | :1234: | `CircBuff` | :heavy_check_mark:
| `EMV` | Ease of Movement | :candle: | :1234: | `CircBuff`, `SMA` | :heavy_check_mark:
| `FibRetracement` | Fibonacci Retracement | :question: | :question: |  | doesn't look an indicator just a simple class with 236 382 5 618 786 values
| `ForceIndex` | Force Index | :candle: | :1234: | prev input val, `EMA` | :heavy_check_mark:
| `HMA` | Hull Moving Average | :1234: | :1234: | `WMA` | :heavy_check_mark:
| `Ichimoku` | Ichimoku Clouds | :1234:  | :m: | `CircBuff` | 5 managed sequences :question: unit tests doesn't exists in [reference implementation](https://github.com/nardew/talipp/issues/87)
| `KAMA` | Kaufman's Adaptive Moving Average | :1234: | :1234: | `CircBuff` | :heavy_check_mark:
| `KeltnerChannels` | Keltner Channels | :candle:  | :m: | `ATR`, `EMA` with `input_modifier` to extract close value of a candle | :heavy_check_mark:
| `KST` | Know Sure Thing | :1234: | :m: | `ROC`, `SMA` | :heavy_check_mark:
| `KVO` | Klinger Volume Oscillator | :candle: | :1234: | `EMA` | :heavy_check_mark:
| `MACD` | Moving Average Convergence Divergence | :1234: | :m: | `EMA` | :heavy_check_mark:
| `MassIndex` | Mass Index | :candle: | :1234: | `EMA`, `CircBuff` | :heavy_check_mark:
| `McGinleyDynamic` | McGinley Dynamic | :1234: | :1234: | `CircBuff` | :heavy_check_mark:
| `MeanDev` | Mean Deviation | :1234: | :1234: | `CircBuff`, `SMA` | :heavy_check_mark:
| `OBV` | On Balance Volume | :candle: | :1234: | prev input val | :heavy_check_mark:
| `ParabolicSAR` | Parabolic Stop And Reverse | :candle: | :m: | `CirBuff` | :heavy_check_mark:
| `PivotsHL` | High/Low Pivots | :candle: | :m: | `-` | :construction: unit tests in reference implementation are [missing](https://github.com/nardew/talipp/issues/85) but code seems quite ready :heavy_check_mark:
| `ROC` | Rate Of Change | :1234: | :1234: | `CircBuff` | :heavy_check_mark:
| `RSI` | Relative Strength Index | :1234: | :1234: | `CircBuff`, `SMMA` | :heavy_check_mark:
| `SFX` | SFX | :candle: | :m: | `ATR`, `StdDev`, `SMA` and `input_modifier` (to extract `close`) | :heavy_check_mark:
| `SMA` | Simple Moving Average | :1234: | :1234: | `CircBuff` | :heavy_check_mark:
| `SMMA` | Smoothed Moving Average | :1234: | :1234: | `CircBuff` | :heavy_check_mark:
| `SOBV` | Smoothed On Balance Volume | :candle: | :1234: | `OBV`, `SMA` | :heavy_check_mark:
| `STC` | Schaff Trend Cycle | :1234: | :1234: | `MACD`, `Stoch` with `input_modifier` (MACDVal->OHLCV and stoch_d->OHLCV), indicator chaining, `MAFactory` (default `SMA`) | :heavy_check_mark:
| `StdDev` | Standard Deviation | :1234: | :1234: | `CircBuff` | :heavy_check_mark:
| `Stoch` | Stochastic | :candle: | :m: | `CircBuff`, `SMA` | :heavy_check_mark: [:christmas_tree:](https://discourse.julialang.org/t/incremental-technical-analysis-indicators/107844/5)
| `StochRSI` | Stochastic RSI | :1234: | :m: | `RSI`, `SMA` | :heavy_check_mark:
| `SuperTrend` | Super Trend | :candle: | :m: | `CircBuff`, `ATR` | :heavy_check_mark:
| `T3` | T3 Moving Average | :1234: | :1234: | `EMA` with indicator chaining and input filter | :heavy_check_mark:
| `TEMA` | Triple Exponential Moving Average | :1234: | :1234: | `EMA` | :heavy_check_mark:
| `TRIX` | TRIX | :candle: | :m: | `EMA`, indicator chaining | :heavy_check_mark:
| `TSI` | True Strength Index | :1234: | :1234: | `EMA`, indicator chaining | :heavy_check_mark:
| `TTM` | TTM Squeeze | :candle: | :m: | `SMA`, `BB`, `DonchianChannels`, `KeltnerChannels` and `input_modifier` to extract `close` value of a candle | :heavy_check_mark:
| `UO` | Ultimate Oscillator | :candle: | :1234: | `CircBuff` | :heavy_check_mark:
| `VTX` | Vortex Indicator | :candle: | :m: | `CircBuff`, `ATR` | :heavy_check_mark:
| `VWAP` |  Volume Weighted Average Price | :candle: | :1234: | - | :heavy_check_mark:
| `VWMA` | Volume Weighted Moving Average | :candle: | :1234: | `CircBuff` | :heavy_check_mark:
| `WMA` | Weighted Moving Average | :1234: | :1234: | `CircBuff` | :heavy_check_mark:
| `ZLEMA` | Zero Lag Exponential Moving Average | :1234: | :1234: | `EMA` | :heavy_check_mark:

### Legend

:1234: single number (input or ouput)

:m: multiple numbers (output)

:candle: OHLCV candlestick input

:1234: :1234: SISO indicators
:1234: :m: SIMO indicators
:candle: :1234: MISO indicators
:candle: :m: MIMO indicators

### Feeding a technical analysis indicator

- A technical indicator can be feeded using `fit!` function.

- It's feeded *one observation at a time*.


#### Showing sample data (close prices)

Some sample data are provided for testing purpose.

```julia
julia> using IncTA
julia> using IncTA.SampleData: CLOSE_TMPL, V_OHLCV
julia> CLOSE_TMPL
50-element Vector{Float64}:
 10.5
  9.78
 10.46
 10.51
  ⋮
 10.15
 10.3
 10.59
 10.23
 10.0
```

#### Calculate `SMA` (simple moving average)

```julia
julia> ind = SMA{Float64}(period = 3)  # this is a SISO (single input / single output) indicator
SMA: n=0 | value=missing

julia> for p in CLOSE_TMPL
           fit!(ind, p)
           println(value(ind))
       end
missing
missing
10.246666666666668
10.250000000000002
10.50666666666667
10.593333333333335
10.476666666666668
 ⋮
9.283333333333339
9.886666666666672
10.346666666666671
10.373333333333338
10.273333333333339
```

#### Calculate BB (Bollinger bands)

```julia
julia> ind = BB{Float64}(period = 3)  # this is a SIMO (single input / multiple output) indicator
       for p in CLOSE_TMPL
           fit!(ind, p)
           println(value(ind))
       end
missing
missing
IncTA.BBVal{Float64}(9.585892709687261, 10.246666666666668, 10.907440623646075)
IncTA.BBVal{Float64}(9.584067070444279, 10.250000000000002, 10.915932929555725)
IncTA.BBVal{Float64}(10.433030926552087, 10.50666666666667, 10.580302406781252)
 ⋮
IncTA.BBVal{Float64}(7.923987085233826, 9.283333333333339, 10.642679581432851)
IncTA.BBVal{Float64}(8.921909932792502, 9.886666666666672, 10.851423400540842)
IncTA.BBVal{Float64}(9.981396599151932, 10.346666666666671, 10.71193673418141)
IncTA.BBVal{Float64}(10.061635473931714, 10.373333333333338, 10.685031192734963)
IncTA.BBVal{Float64}(9.787718030627357, 10.273333333333339, 10.758948636039321)
```

#### Showing sample data (OHLCV data)

```julia
julia> V_OHLCV  # fields are open/high/low/close/volume/time
50-element Vector{OHLCV{Missing, Float64, Float64}}:
 OHLCV{Missing, Float64, Float64}(10.81, 11.02, 9.9, 10.5, 55.03, missing)
 OHLCV{Missing, Float64, Float64}(10.58, 10.74, 9.78, 9.78, 117.86, missing)
 OHLCV{Missing, Float64, Float64}(10.07, 10.65, 9.5, 10.46, 301.04, missing)
 OHLCV{Missing, Float64, Float64}(10.58, 11.05, 10.47, 10.51, 157.94, missing)
 ⋮
 OHLCV{Missing, Float64, Float64}(9.3, 10.5, 9.26, 10.15, 255.3, missing)
 OHLCV{Missing, Float64, Float64}(10.23, 10.3, 10.0, 10.3, 111.55, missing)
 OHLCV{Missing, Float64, Float64}(10.29, 10.86, 10.19, 10.59, 108.27, missing)
 OHLCV{Missing, Float64, Float64}(10.77, 10.77, 10.15, 10.23, 48.29, missing)
 OHLCV{Missing, Float64, Float64}(10.28, 10.39, 9.62, 10.0, 81.66, missing)
```

#### Calculate ATR (Average true range)

```julia
julia> ind = ATR{OHLCV}(period = 3)  # this is a MISO (multi input / single output) indicator
ATR: n=0 | value=missing

julia> for candle in V_OHLCV
           fit!(ind, candle)
           println(value(ind))
       end
missing
missing
1.0766666666666669
0.9144444444444445
0.7562962962962961
 ⋮
0.898122497312842
0.6987483315418949
0.6891655543612633
0.6661103695741752
0.700740246382784
```

#### Calculate Stoch (Stochastic)

```julia
julia> ind = Stoch{OHLCV{Missing,Float64,Float64}}(period = 3)  # this is a MIMO indicator
Stoch: n=0 | value=missing

julia> for candle in V_OHLCV
           fit!(ind, candle)
           println(value(ind))
       end
IncTA.StochVal{Float64}(53.57142857142858, missing)
IncTA.StochVal{Float64}(0.0, missing)
IncTA.StochVal{Float64}(63.15789473684218, 38.90977443609025)
IncTA.StochVal{Float64}(65.1612903225806, 42.77306168647426)
IncTA.StochVal{Float64}(67.74193548387099, 65.35370684776458)
 ⋮
IncTA.StochVal{Float64}(83.17307692307695, 54.98661936768733)
IncTA.StochVal{Float64}(90.38461538461543, 83.17307692307693)
IncTA.StochVal{Float64}(83.12500000000001, 85.56089743589745)
IncTA.StochVal{Float64}(26.744186046511697, 66.75126714370903)
IncTA.StochVal{Float64}(30.645161290322637, 46.83811577894477)
```

### Feeding a technical analysis indicator with a compatible Tables.jl table such as TSFrame.

A technical analysis indicator can also accept a [Tables.jl](https://tables.juliadata.org/) compatible table (`TSFrame`) as input parameter.

#### Showing sample data (OHLCV data)

```julia
julia> using MarketData
julia> using TSFrames
julia> using Random
julia> Random.seed!(1234)  # to have reproductible results (so won't be really random)
julia> ta = random_ohlcv()  # should return a TimeSeries.TimeArray
julia> ts = TSFrame(ta)  # converts a TimeSeries.TimeArray to TSFrames.TSFrame
500×5 TSFrame with DateTime Index
 Index                Open     High     Low      Close    Volume
 DateTime             Float64  Float64  Float64  Float64  Float64
──────────────────────────────────────────────────────────────────
 2020-01-01T00:00:00   326.75   334.03   326.18   333.16     83.6
 2020-01-01T01:00:00   333.29   334.6    330.01   330.3      45.9
 2020-01-01T02:00:00   330.79   336.7    329.99   334.0      71.2
 2020-01-01T03:00:00   334.83   339.79   334.83   338.39     97.1
 2020-01-01T04:00:00   338.36   339.09   331.22   331.22     79.1
          ⋮              ⋮        ⋮        ⋮        ⋮        ⋮
 2020-01-21T15:00:00   353.2    360.62   349.99   358.86     59.0
 2020-01-21T16:00:00   358.81   364.03   354.5    364.03      4.2
 2020-01-21T17:00:00   363.06   367.52   362.31   362.31     90.0
 2020-01-21T18:00:00   362.03   364.81   360.4    363.3      45.6
 2020-01-21T19:00:00   362.35   363.23   358.28   361.52     19.8
```

#### Simple Moving Average (`SMA`) of close prices

```julia
julia> SMA(ts; period = 3)
500×1 TSFrame with DateTime Index
 Index                SMA
 DateTime             Float64?
──────────────────────────────────
 2020-01-01T00:00:00  missing
 2020-01-01T01:00:00  missing
 2020-01-01T02:00:00      332.487
 2020-01-01T03:00:00      334.23
 2020-01-01T04:00:00      334.537
          ⋮                ⋮
 2020-01-21T15:00:00      352.087
 2020-01-21T16:00:00      358.41
 2020-01-21T17:00:00      361.733
 2020-01-21T18:00:00      363.213
 2020-01-21T19:00:00      362.377
```

#### Simple Moving Average (`SMA`) of open prices

```julia
julia> SMA(ts; period = 3, default = :Open)
500×1 TSFrame with DateTime Index
 Index                SMA
 DateTime             Float64?
──────────────────────────────────
 2020-01-01T00:00:00  missing
 2020-01-01T01:00:00  missing
 2020-01-01T02:00:00      330.277
 2020-01-01T03:00:00      332.97
 2020-01-01T04:00:00      334.66
          ⋮                ⋮
 2020-01-21T15:00:00      346.72
 2020-01-21T16:00:00      352.293
 2020-01-21T17:00:00      358.357
 2020-01-21T18:00:00      361.3
 2020-01-21T19:00:00      362.48
```

#### Calculate `BB` (Bollinger bands)

```julia
julia> SMA(ts; period = 3)
500×1 TSFrame with DateTime Index
 Index                SMA
 DateTime             Float64?
──────────────────────────────────
 2020-01-01T00:00:00  missing
 2020-01-01T01:00:00  missing
 2020-01-01T02:00:00      332.487
 2020-01-01T03:00:00      334.23
 2020-01-01T04:00:00      334.537
          ⋮                ⋮
 2020-01-21T15:00:00      352.087
 2020-01-21T16:00:00      358.41
 2020-01-21T17:00:00      361.733
 2020-01-21T18:00:00      363.213
 2020-01-21T19:00:00      362.377
```

#### Calculate `ATR` (Average true range)

```julia
julia> ATR(ts; period = 3)
500×1 TSFrame with DateTime Index
 Index                ATR
 DateTime             Float64?
────────────────────────────────────
 2020-01-01T00:00:00  missing
 2020-01-01T01:00:00  missing
 2020-01-01T02:00:00        6.38333
 2020-01-01T03:00:00        6.18556
 2020-01-01T04:00:00        6.74704
          ⋮                 ⋮
 2020-01-21T15:00:00        8.53068
 2020-01-21T16:00:00        8.86378
 2020-01-21T17:00:00        7.64586
 2020-01-21T18:00:00        6.56724
 2020-01-21T19:00:00        6.05149
```

##### Calculate `Stoch` (Stochastic)

```julia
julia> Stoch(ts; period = 3)
500×2 TSFrame with DateTime Index
 Index                Stoch_k    Stoch_d
 DateTime             Float64    Float64?
───────────────────────────────────────────────
 2020-01-01T00:00:00   88.9172   missing
 2020-01-01T01:00:00   48.9311   missing
 2020-01-01T02:00:00   74.3346        70.7276
 2020-01-01T03:00:00   85.7143        69.66
 2020-01-01T04:00:00   12.551         57.5333
          ⋮               ⋮            ⋮
 2020-01-21T15:00:00   91.4272        93.9504
 2020-01-21T16:00:00  100.0           97.1424
 2020-01-21T17:00:00   70.2795        87.2356
 2020-01-21T18:00:00   67.5883        79.2893
 2020-01-21T19:00:00   35.0649        57.6443
```

## API Documentation
### Indicators (alphabetically ordered)
```@docs
IncTA.ADX
IncTA.ALMA
IncTA.AO
IncTA.ATR
IncTA.AccuDist
IncTA.Aroon
IncTA.BB
IncTA.BOP
IncTA.CCI
IncTA.CHOP
IncTA.ChaikinOsc
IncTA.ChandeKrollStop
IncTA.CoppockCurve
IncTA.DEMA
IncTA.DPO
IncTA.DonchianChannels
IncTA.EMA
IncTA.EMV
IncTA.ForceIndex
IncTA.HMA
IncTA.KAMA
IncTA.KST
IncTA.KVO
IncTA.KeltnerChannels
IncTA.MACD
IncTA.MassIndex
IncTA.McGinleyDynamic
IncTA.MeanDev
IncTA.OBV
IncTA.ParabolicSAR
IncTA.PivotsHL
IncTA.ROC
IncTA.RSI
IncTA.SFX
IncTA.SMA
IncTA.SMMA
IncTA.SOBV
IncTA.STC
IncTA.StdDev
IncTA.Stoch
IncTA.StochRSI
IncTA.SuperTrend
IncTA.T3
IncTA.TEMA
IncTA.TRIX
IncTA.TSI
IncTA.TTM
IncTA.UO
IncTA.VTX
IncTA.VWAP
IncTA.VWMA
IncTA.WMA
IncTA.ZLEMA
```

### Other
```@docs
IncTA.StatLag
IncTA.TechnicalIndicatorIterator
```
