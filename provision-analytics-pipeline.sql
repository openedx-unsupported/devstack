CREATE DATABASE IF NOT EXISTS reports;
CREATE DATABASE IF NOT EXISTS edx_hive_metastore;
GRANT ALL PRIVILEGES ON edx_hive_metastore.* TO 'edx_hive'@'%' IDENTIFIED BY 'edx';
GRANT ALL PRIVILEGES ON `test\_%`.* TO 'edx_hive'@'%' IDENTIFIED BY 'edx';
GRANT ALL PRIVILEGES ON reports.* TO 'pipeline001'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON `acceptance\_%`.* TO 'pipeline001'@'%' IDENTIFIED BY 'password';
GRANT SELECT ON edxapp.* TO 'read_only'@'%' IDENTIFIED BY 'password';

FLUSH PRIVILEGES;