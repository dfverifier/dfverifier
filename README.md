Dear all,

This is a description of our prototype tool, DFVerifer, which verifies the BIBO stability of Digital filters. This tool is developed according to our paper "Poles-based Invariant Generation for Verifying the BIBO Stability of Digital Filters", published in HSCC 2024.

#### Structure

- `bin` contains the executable.
- `benchmarks` contains the benchmarks used in the evaluation. A valid benchmark consists of six components. "A" stands for the "-a_1,-a_2,...,-a_M" in the paper. "B" stands for the "b_0,b_1,...,b_N" in the paper. "Input" is the input range. "Output" is the interval to check. "init_outputs" and "init_inputs" refer to the initial state. "init_inputs" is omitted if it's empty. Besides, we use "[,]" to represent an interval.
- `scripts` contains some useful scripts to run the experiments. `print_benchmarks.sh` prints all the benchmarks. `verify_benchmarks.sh` runs 'dfverifier' on the benchmarks.

#### Usage

We successfully ran the executable on Ubuntu 22.04 with GSL installed.

Use `./dfverifier <filename>` to verify the filter specified by `filename`. For example, `bin/dfverifier benchmarks/ex01.txt` is a valid command. Besides, users can run `./dfverifier -v <filename>` to show the computational process. 

"TRUE" means the output values are within the interval. "FALSE" means some output values exceed the interval. "UNKNOWN" means DFVerifier cannot determine whether the output values are within the interval.

As for SageMath, we provide `poly_solver.sage`. Specifically, we use `sage /dfverifier/scripts/poly_solver.sage --test 10000` to test the ability of SageMath, which corresponds to Sec. 5.4 in the paper. `sage /dfverifier/scripts/poly_solver.sage --solve <poly>` is to solve a given polynomial. For example, to solve "0.7-1.4*x+x^2=0", we can use `sage /dfverifier/scripts/poly_solver.sage --solve 0.7,-1.4,1`. In the output, each line is a complex root represented by a real and an imaginary interval.
