CREATE DATABASE library_db;

CREATE USER 'library_user'@'%' IDENTIFIED BY 'library@api';

GRANT ALL PRIVILEGES
ON library_db.*
TO 'library_user'@'%';

FLUSH PRIVILEGES;