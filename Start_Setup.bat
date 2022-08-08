wget https://github.com/The-Alpha-Project/alpha-core/archive/refs/heads/master.zip
tar -xf master.zip
del /F /Q master.zip
winget install --id=Python.Python.3  -e
winget install --id=Microsoft.PowerShell  -e
winget install --id=MariaDB.Server  -e
start pwsh -NoProfile -ExecutionPolicy Bypass -Command "& './Setup_alpha-core.ps1'"