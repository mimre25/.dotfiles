#!python
import requests

import sys


STAND_HEIGHT = 95
SIT_HEIGHT = 60


mode = sys.argv[1]

if mode == "stand":
    height = STAND_HEIGHT
elif mode == "sit":
    height = SIT_HEIGHT
else:
    raise Exception("Unknown Mode")


resp = requests.post(f"http://megadesk.local/number/megadesk_height__cm_/set?value={height}", {
    "credentials": "omit",
    "headers": {
        "Accept": "*/*",
        "Content-Type": "text/plain;charset=UTF-8",
        "Pragma": "no-cache",
        "Cache-Control": "no-cache"
    },
    "referrer": "http://megadesk.local/",
    "body": "true",
    "method": "POST",
    "mode": "cors"
})
if resp.status_code != 200:
    print(resp)
    print(resp.text)
