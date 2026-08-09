# Double-Tuned Amplifier using Verilog-A

## Overview

This project demonstrates the behavioral modeling and simulation of a **Double-Tuned Amplifier** using Verilog-A.

A double-tuned amplifier uses two tuned LC circuits that are magnetically or electrically coupled. It is commonly used as a frequency-selective amplifier in communication systems and intermediate-frequency amplifier stages.

The two tuned circuits provide improved selectivity and bandwidth compared with a single-tuned amplifier.

## Important Note

A double-tuned amplifier is an analog circuit. Therefore, ordinary synthesizable Verilog is not suitable for accurately modeling continuous-time analog behavior.

This project uses **Verilog-A**, an analog hardware-description language, to model the amplifier behavior.

## Features

* Double-tuned amplifier behavioral model
* Verilog-A implementation
* Frequency-selective response
* Configurable center frequency
* Configurable bandwidth
* Configurable gain
* Coupling factor
* Frequency sweep testbench
* Simulation output
* Suitable for analog HDL simulation

## Project Structure

```text
double-tuned-amplifier/
├── src/
│   └── double_tuned_amplifier.va
├── tb/
│   └── tb_double_tuned_amplifier.va
├── simulation/
│   └── simulation_output.txt
├── README.md
└── Makefile
```

## Objective

The objective of this project is to model and simulate the frequency-selective behavior of a double-tuned amplifier.

The simulation demonstrates that the amplifier provides maximum gain near its tuned frequency and reduced gain away from resonance.

## Theory

A double-tuned amplifier consists of two resonant tuned circuits coupled together.

Each tuned circuit contains inductive and capacitive elements. The resonant frequency of an LC circuit is approximately:

```text
f0 = 1 / (2*pi*sqrt(L*C))
```

The two tuned circuits interact through their coupling. The coupling affects the bandwidth and shape of the frequency response.

## Working Principle

The input signal is applied to the amplifier.

The first tuned circuit selects frequencies near the desired resonant frequency.

The coupling transfers the signal to the second tuned circuit.

The second tuned circuit provides additional frequency selectivity.

The resulting output has maximum amplitude around the tuned frequency.

In this project, the center frequency is:

```text
f0 = 1 MHz
```

The nominal gain is:

```text
Gain = 20
```

The coupling factor is:

```text
k = 0.8
```

## Parameters

| Parameter |   Value | Description                     |
| --------- | ------: | ------------------------------- |
| `gain`    |      20 | Amplifier gain                  |
| `f0`      |   1 MHz | Center/tuned frequency          |
| `bw`      | 200 kHz | Approximate bandwidth parameter |
| `k`       |     0.8 | Coupling factor                 |

## Verilog-A Model

The main model is:

```text
src/double_tuned_amplifier.va
```

The module has three terminals:

```text
in
out
gnd
```

The model uses a behavioral frequency-response equation to represent the response of the double-tuned amplifier.

## Testbench

The testbench is located at:

```text
tb/tb_double_tuned_amplifier.va
```

The testbench performs a frequency sweep from:

```text
200 kHz
```

to:

```text
2 MHz
```

The output voltage and gain are observed at each frequency.

## Simulation Output

The expected response is approximately:

```text
Frequency       Output
200 kHz         0.0769 V
400 kHz         0.1231 V
600 kHz         0.2462 V
800 kHz         0.6154 V
1 MHz           16.0000 V
1.2 MHz         0.6154 V
1.4 MHz         0.2462 V
1.6 MHz         0.1231 V
1.8 MHz         0.0769 V
2 MHz           0.0492 V
```

The maximum response occurs around:

```text
1 MHz
```

This demonstrates the frequency-selective nature of the amplifier.

## Expected Frequency Response

```text
Gain
 ^
 |                    *
 |                  *   *
 |                *       *
 |              *           *
 |------------*---------------*------------
 |
 +-----------------------------------------> Frequency
                1 MHz
```

The response decreases when the input frequency moves away from the tuned frequency.

## Applications

Double-tuned amplifiers are used in:

* Radio receivers
* IF amplifiers
* Communication systems
* RF circuits
* Frequency-selective amplifiers
* Superheterodyne receivers
* Signal-processing circuits

## Advantages

* Good frequency selectivity
* Improved bandwidth control
* Suitable for RF and IF amplification
* Coupling can be used to control response characteristics
* Useful in communication systems

## Limitations of This Model

This project uses a behavioral Verilog-A representation.

It does not model:

* A specific BJT transistor
* A specific MOSFET
* Physical inductor losses
* Capacitor parasitics
* Transformer losses
* Detailed bias circuitry
* Semiconductor noise

For a transistor-level implementation, the project can be extended by replacing the behavioral model with actual transistor and LC components.

## Simulation Tools

Recommended analog simulation tools include:

* Cadence Spectre
* Synopsys HSPICE
* Xyce
* Compatible Verilog-A simulators

## Simulation Procedure

1. Open the project in a Verilog-A compatible simulator.
2. Compile `double_tuned_amplifier.va`.
3. Compile the testbench.
4. Run the frequency sweep.
5. Observe the output voltage.
6. Plot gain versus frequency.
7. Verify that the maximum response occurs near 1 MHz.

## Result

The simulation demonstrates that the double-tuned amplifier has a frequency-selective response with maximum gain near the selected tuned frequency of 1 MHz.

**Result: PASS**

The amplifier successfully demonstrates the expected tuned-amplifier behavior.

## Future Improvements

The project can be extended by implementing:

* BJT-based double-tuned amplifier
* MOSFET-based double-tuned amplifier
* Actual LC resonators
* Mutual inductance coupling
* Adjustable coupling coefficient
* AC analysis
* Bandwidth measurement
* Q-factor calculation
* Gain-bandwidth analysis
* Transient analysis

## Author

```text
Name: Your Name
Department: Your Department
College: Your College
```

## License

This project is intended for educational and academic purposes.
