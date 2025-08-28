# Creating Python virtual environment
python -m venv venv

# Activating the environment
.\venv\Scripts\Activate.ps1

# Updating pip
python -m pip install --upgrade pip

# Installing cocotb and basic dependencies
pip install cocotb cocotb-bus pytest pytest-cov

Write-Output "Environment configured with cocotb in PowerShell"
