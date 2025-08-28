@echo off
REM Creating a Python virtual environment
python -m venv venv

REM Activating the environment
call venv\Scripts\activate

REM Updating pip
python -m pip install --upgrade pip

REM Installing cocotb and basic dependencies
pip install cocotb cocotb-bus pytest pytest-cov

echo Environment configured with cocotb in Windows CMD
