

# crond task 

```bash
0>--0>--*>--*>--*>--(cd /root/hse_db_data && /usr/bin/sh run.sh 0  >  db0.log 2>&1 )
0>--1>--*>--*>--*>--(cd /root/hse_db_data && /usr/bin/sh run.sh 1  >  db1.log 2>&1 )
```

# notes

1. crond job 无法使用~/.bash_profile 中定义的环境变量， 需要手动配置到  run.sh中




