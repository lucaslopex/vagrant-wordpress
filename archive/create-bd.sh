#!/bin/bash

mysql -e "create database wordpress;" &&
mysql -e "create user wordpress@localhost identified by 'Word@321#BD';" &&
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';"
