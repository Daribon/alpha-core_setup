rmdir /Q /S alpha-core-master
wget https://github.com/The-Alpha-Project/alpha-core/archive/refs/heads/master.zip
tar -xf master.zip
del /F /Q master.zip
start pwsh -NoProfile -ExecutionPolicy Bypass -Command "& './Setup_alpha-core.ps1'"