curl -LJO https://github.com/The-Alpha-Project/alpha-core/archive/refs/heads/master.zip
tar -xf alpha-core-master.zip
del /F /Q alpha-core-master.zip
winget install --id=Python.Python.3.11 -e
winget install --id=Microsoft.PowerShell -e
winget install --id=MariaDB.Server -v "10.9.3.0" -e
start pwsh -NoProfile -ExecutionPolicy Bypass -Command "& './scripts/Setup_alpha-core.ps1'"