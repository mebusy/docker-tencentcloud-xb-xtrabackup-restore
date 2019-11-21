docker build -t tc_mysql .

docker run -v`pwd`/hse.xb:/backup.xb -p33061:3306  --rm --name tc_mysql  tc_mysql 

