#!/bin/sh

# Creating Python virtual environment
python3 -m venv venv

# Activating virtual environment
. venv/bin/activate

# Updating pip
python -m pip install --upgrade pip

# Installing cocotb and basic dependencies
pip install cocotb cocotb-bus pytest pytest-cov

echo "Environment configured with cocotb in Linux"
