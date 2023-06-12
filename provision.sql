CREATE DATABASE IF NOT EXISTS credentials;
CREATE USER 'credentials001'@'%' IDENTIFIED BY 'password';
GRANT ALL ON credentials.* TO 'credentials001'@'%';

CREATE DATABASE IF NOT EXISTS discovery;
CREATE USER 'discov001'@'%' IDENTIFIED BY 'password';
GRANT ALL ON discovery.* TO 'discov001'@'%';

CREATE DATABASE IF NOT EXISTS ecommerce;
CREATE USER 'ecomm001'@'%' IDENTIFIED BY 'password';
GRANT ALL ON ecommerce.* TO 'ecomm001'@'%';

CREATE DATABASE IF NOT EXISTS notes;
CREATE USER 'notes001'@'%' IDENTIFIED BY 'password';
GRANT ALL ON notes.* TO 'notes001'@'%';

CREATE DATABASE IF NOT EXISTS registrar;
CREATE USER 'registrar001'@'%' IDENTIFIED BY 'password';
GRANT ALL ON registrar.* TO 'registrar001'@'%';

CREATE DATABASE IF NOT EXISTS xqueue;
CREATE USER 'xqueue001'@'%' IDENTIFIED BY 'password';
GRANT ALL ON xqueue.* TO 'xqueue001'@'%';

CREATE DATABASE IF NOT EXISTS `dashboard`;
CREATE USER 'analytics001'@'%' IDENTIFIED BY 'password';
GRANT ALL ON `dashboard`.* TO 'analytics001'@'%';

CREATE DATABASE IF NOT EXISTS `analytics-api`;
GRANT ALL ON `analytics-api`.* TO 'analytics001'@'%';

CREATE DATABASE IF NOT EXISTS `reports`;
GRANT ALL ON `reports`.* TO 'analytics001'@'%';

CREATE DATABASE IF NOT EXISTS `reports_v1`;
GRANT ALL ON `reports_v1`.* TO 'analytics001'@'%';

CREATE DATABASE IF NOT EXISTS edxapp;
CREATE DATABASE IF NOT EXISTS edxapp_csmh;
CREATE USER 'edxapp001'@'%' IDENTIFIED BY 'password';
GRANT ALL ON edxapp.* TO 'edxapp001'@'%';
GRANT ALL ON edxapp_csmh.* TO 'edxapp001'@'%';

FLUSH PRIVILEGES;
