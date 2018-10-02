CREATE DATABASE IF NOT EXISTS dashboard;
GRANT ALL ON dashboard.* TO 'rosencrantz'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS reports;
GRANT ALL ON reports.* TO 'reports001'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `analytics-api`;
GRANT ALL ON `analytics-api`.* TO 'api001'@'%' IDENTIFIED BY 'password';


FLUSH PRIVILEGES;
