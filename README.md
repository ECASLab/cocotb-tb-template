# **Cocotb Testbench Template**

A GitHub template for building modular, reusable verification environments with [cocotb](https://www.cocotb.org/).

It includes a clean directory layout, helper utilities, and a universal runner (run_test.py) that can execute any cocotb test on any compatible DUT.

## **Repository Structure**

```text
├── src/
│   ├── dut/                 # RTL (Verilog) for each DUT
│   └── sim/
│       ├── assertions/      # Assertion/checker helpers
│       ├── coverage/        # Functional coverage models
│       ├── sequences/       # Stimulus generators / sequences
│       ├── tests/           # Cocotb test modules (e.g. test_rca_basic.py)
│       └── utils/
│           ├── cocotb_runner.py   # Backend runner wrapped by run_test.py
│           └── config_loader.py   # Optional config helper (YAML/JSON/env)
├── run_test.py              # Universal CLI to run tests (see below)
├── Makefile                 # Make-based flow (optional)
├── install.sh               # Linux/macOS setup
├── install.cmd              # Windows CMD setup
├── install.ps1              # Windows PowerShell setup
├── LICENSE
└── README.md
```

## **Requirements**

- Python 3.8+
- pip and venv
- One supported simulator:
  - Open-source: Icarus Verilog, Verilator

## **Setup**

Use one of the platform scripts:

### **Linux**

```bash
chmod +x install.sh
./install.sh
```

### **Windows (CMD)**

```cmd
install.cmd
```

### **Windows (PowerShell)**

```powershell
.\install.ps1
```

These scripts create venv/, upgrade pip, and install:

- cocotb
- cocotb-bus
- pytest
- pytest-cov (and friends).

## **Run Tests (recommended)**

`run_test.py` is a universal command-line entry point that launches any cocotb test against any compatible DUT.

It wraps the lower-level logic in `sim/utils/cocotb_runner.py`.

### **Usage**

```bash
python run_test.py --dut <dut_name> --test <test_name>
```

- `--dut`: the DUT name (e.g., the RTL top in `src/dut/`)
- `--test`: the test module name under `src/sim/tests/` (without `.py`)

### **Selecting a Simulator**

`run_test.py` defers to `sim/utils/cocotb_runner.py`.

Typically you can choose the simulator with an environment variable (the runner reads it) or a runner argument (if implemented).

```bash
# Use Icarus Verilog
SIM=icarus python run_test.py --dut rca --test test_add_basic

# Use Verilator
SIM=verilator python run_test.py --dut rca --test test_add_basic

# Use Questa/ModelSim
SIM=questa python run_test.py --dut rca --test test_add_basic
```

### **Additional Controls**

You can commonly pass:

- `TOPLEVEL_LANG` to force verilog/VHDL
- Include directories or extra sources via env vars (`EXTRA_SOURCES`, `INCLUDES`)
- Waveform generation flags (e.g., `WAVES=1`)
- Seed / randomization (`RANDOM_SEED`)

Example:

```bash
SIM=verilator WAVES=1 RANDOM_SEED=123 \
python run_test.py --dut rca --test test_add_basic
```

## **Alternative: Makefile Flow**

You can still use the canonical cocotb Makefile interface:

```bash
make SIM=icarus TOPLEVEL=<dut_top> MODULE=<test_module>
# Example:
make SIM=icarus TOPLEVEL=rca MODULE=test_add_basic
```

This is handy for quick local checks or CI pipelines that already rely on Make.

## **License**

MIT - free to use, modify, and distribute.
