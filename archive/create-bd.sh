
BD="wordpress"
User="wordpress@localhost"
PWD="Word@321#BD"

SQL_CDATA="create database "$BD";"
SQL_CUSER="create user "$User";"
SQL_PERM="GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER; FLUSH PRIVILEGES;"

mysql -u root -e "SQL_CDATA" mysql
mysql -u root -e "SQL_CUSER" mysql
mysql -u root -e "SQL_PERM" mysql
