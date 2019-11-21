To start a mysql server container from xtrabackup file backuped by Tencent cloud mysql service.

# How to

1. build docker imaget locally 
	- 
	```bash
	docker build -t tc_mysql .
	```

2. start mysql server container from .xb file
	- 
	```bash
	docker run -v<PATH-TO-YOUR-LOCAL-XB-FILE>:/backup.xb -p33061:3306  --rm --name tc_mysql  tc_mysql 
	```
	- i.e.
		- 
		```
		docker run -v`pwd`/hse.xb:/backup.xb -p33061:3306  --rm --name tc_mysql  tc_mysql
		```

3. connect by mysql client 
	- 
	```bash
	mysql -h 127.0.0.1 -P 33061  -u root
	```


