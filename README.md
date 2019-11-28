

# crond task 

```bash
0>--0>--*>--*>--*>--(cd /root/hse_db_data && /usr/bin/sh run.sh 0  >  db0.log 2>&1 )
0>--1>--*>--*>--*>--(cd /root/hse_db_data && /usr/bin/sh run.sh 1  >  db1.log 2>&1 )
```


