                                                                                                     
# To install pythonSDK :
#    pip install tencentcloud-sdk-python
#
 
from tencentcloud.common import credential
from tencentcloud.common.profile.client_profile import ClientProfile
from tencentcloud.common.profile.http_profile import HttpProfile
from tencentcloud.common.exception.tencent_cloud_sdk_exception import TencentCloudSDKException 
from tencentcloud.cdb.v20170320 import cdb_client, models 


import pprint
import json

import sys

if len(sys.argv) < 2 :
    print "usage: xxx.py < db_instance_id>  "
    sys.exit(1)

try:
    cred = credential.Credential("secrent id", "secrent key")
    httpProfile = HttpProfile()
    httpProfile.endpoint = "cdb.tencentcloudapi.com"

    clientProfile = ClientProfile()
    clientProfile.httpProfile = httpProfile
    client = cdb_client.CdbClient(cred, "ap-shanghai", clientProfile)

    # game server db: cdb-4t349sf6
    # dat track db: cdb-giruy018
    # for db_id in [ "cdb-4t349sf6" , "cdb-giruy018" ]:
    if True:
        db_id = sys.argv[1]

        req = models.DescribeBackupsRequest()
        params = '{{"InstanceId":"{}"}}'.format( db_id )
        req.from_json_string(params)

        resp = client.DescribeBackups(req)
        obj = json.loads(resp.to_json_string())
        # pprint.pprint(obj)
        links = [ x["InternetUrl"] for x in obj["Items"] if x["Status"]=='SUCCESS' ]
        print links[0]

except TencentCloudSDKException as err:
    print(err)


