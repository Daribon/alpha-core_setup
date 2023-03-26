# alpha-core_setup

Scripts to automate alpha-core setup with minimal user input.

## Prerequisites
Windows 10 version 1803 (build 17063) or above.

## How to setup:
1. Run ```Setup.bat```
2. When asked for user input just press enter.
3. Wait for server to finish loading.
4. Open realmlist.wtf in your client
5. Change it to the following: SET realmlist "127.0.0.1"
5. Start alpha client and login.

## How to start server after setup script closed:
1. Run ```Start MariaDB.bat```
2. Run ```Start_alpha-core.bat```
3. Once server finished loading, start alpha client and login.

## How to update:
1. Go into update folder
2. Run ```Update.bat``` 
3. When asked for user input just press enter.
4. Once server finished loading, start alpha client and login.