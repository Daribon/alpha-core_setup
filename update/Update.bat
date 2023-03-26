cd ..
rmdir /Q /S alpha-core-master
curl -LJO https://github.com/The-Alpha-Project/alpha-core/archive/refs/heads/master.zip
tar -xf alpha-core-master.zip
del /F /Q alpha-core-master.zip
start pwsh -NoProfile -ExecutionPolicy Bypass -Command "& './scripts/Update_alpha-core.ps1'"