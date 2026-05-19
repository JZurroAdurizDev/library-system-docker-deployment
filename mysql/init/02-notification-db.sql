CREATE DATABASE notification_db;

CREATE USER 'notification_user'@'%' IDENTIFIED BY 'notific@tionService';

GRANT ALL PRIVILEGES
ON notification_db.*
TO 'notification_user'@'%';

FLUSH PRIVILEGES;