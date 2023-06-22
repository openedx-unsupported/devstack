#docker-compose exec -T mysql80 bash -e -c "mysql -uroot mysql" < drop-mysql-user.sql 
#docker exec -it edx.devstack.mysql80 mysql

drop user 'credentials001'@'%';
drop user 'discov001'@'%';
drop user 'ecomm001'@'%';
drop user 'notes001'@'%';
drop user 'registrar001'@'%';
drop user 'xqueue001'@'%';
drop user 'analytics001'@'%';
drop user 'edxapp001'@'%';
