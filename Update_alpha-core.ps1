#Requires -Version 7.0
cd alpha-core-master
if ($IsWindows) {
    $env:Path += ';C:\Program Files\MariaDB 10.8\bin'
    $env:Path += ';C:\Users\IPSUM\AppData\Local\Programs\Python\Python310'
    $env:Path += ';C:\Users\IPSUM\AppData\Local\Programs\Python\Python310\Scripts'
}
pip3 install -r requirements.txt
$username = ($v = Read-Host "Enter your database username [root]") ? $v : 'root'
$password = ($v = Read-Host "Enter your database password []") ? $v : ''
$port = ($v = Read-Host "Enter your database port [3306]") ? $v : '3306'
$realm = ($v = Read-Host "Enter your realm database [alpha_realm]") ? $v : 'alpha_realm'
$dbc = ($v = Read-Host "Enter your dbc database [alpha_dbc]") ? $v : 'alpha_dbc'
$world = ($v = Read-Host "Enter your world database [alpha_world]") ? $v : 'alpha_world'
start mariadbd.exe --console
mariadb --user=$username --password=$password --port=$port $realm -e "source etc\databases\realm\updates\updates.sql"
mariadb --user=$username --password=$password --port=$port $dbc -e "source etc\databases\dbc\updates\updates.sql"
mariadb --user=$username --password=$password --port=$port $world -e "source etc\databases\world\updates\updates.sql"
Rename-Item -Path "etc/config/config.yml.dist" -NewName "config.yml"
(Get-Content etc/config/config.yml) -Replace 'host: 0.0.0.0', 'host: 127.0.0.1' | Set-Content etc/config/config.yml
(Get-Content etc/config/config.yml) -Replace "username: root", "username: $username" | Set-Content etc/config/config.yml
(Get-Content etc/config/config.yml) -Replace "password: pwd", "password: ''" | Set-Content etc/config/config.yml
(Get-Content etc/config/config.yml) -Replace "password: ''", "password: '$password'" | Set-Content etc/config/config.yml
(Get-Content etc/config/config.yml) -Replace "realm_db: alpha_realm", "realm_db: $realm" | Set-Content etc/config/config.yml
(Get-Content etc/config/config.yml) -Replace "dbc_db: alpha_dbc", "dbc_db: $dbc" | Set-Content etc/config/config.yml
(Get-Content etc/config/config.yml) -Replace "world_db: alpha_world", "world_db: $world" | Set-Content etc/config/config.yml
py main.py
