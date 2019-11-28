
export _proxy=127.0.0.1:3128
export  http_proxy=http://$_proxy
export https_proxy=http://$_proxy


export  HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy


db_index="$1"

db_ids=( "mysql instance id 1"  "mysql instance id 2"   )
names=("hse"  "hse_dt")

if [ "$db_index" -lt 0 -o "$db_index" -gt 1 ]
then
    echo "parameter db_index invalid"
    exit
fi

# echo $db_index
db_id=${db_ids[$db_index]}
name=${names[$db_index]}
# echo $db_id

url=`python mysql_backup.py   $db_id`
echo $name $url

rm -f $name.xb
# echo wget -O $name.xb "$url"
wget -O $name.xb "$url"

if [ $? -eq 0 ]
then
    echo "downloaded"
else
    echo "downloading failed"
    exit 1
fi



serverName=tc_mysql_$db_index
docker rm -f ${serverName}
docker run --restart unless-stopped -d --name ${serverName}  -p 3306$db_index:3306 -v`pwd`/$name.xb:/backup.xb  tc_mysql

echo starting $serverName

