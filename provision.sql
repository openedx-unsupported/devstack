CREATE DATABASE IF NOT EXISTS credentials;
GRANT ALL ON credentials.* TO 'credentials001'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS discovery;
GRANT ALL ON discovery.* TO 'discov001'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS ecommerce;
GRANT ALL ON ecommerce.* TO 'ecomm001'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS edxmktg;
GRANT ALL ON edxmktg.* TO 'edxmktg001'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS notes;
GRANT ALL ON notes.* TO 'notes001'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS registrar;
GRANT ALL ON registrar.* TO 'registrar001'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS xqueue;
GRANT ALL ON xqueue.* TO 'xqueue001'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS edxapp;
CREATE DATABASE IF NOT EXISTS edxapp_csmh;
GRANT ALL ON edxapp.* TO 'edxapp001'@'%' IDENTIFIED BY 'password';
GRANT ALL ON edxapp_csmh.* TO 'edxapp001'@'%';

FLUSH PRIVILEGES;
