#!python
import requests

import sys


STAND_HEIGHT = 98
SIT_HEIGHT = 60


mode = sys.argv[1]

if mode == "stand":
    height = STAND_HEIGHT
elif mode == "sit":
    height = SIT_HEIGHT
else:
    try:
        height = int(mode)
    except:
        raise Exception(f"Unknown Mode {mode}")


resp = requests.post(f"http://megadesk.local/number/megadesk_height__cm_/set?value={height}")

if resp.status_code != 200:
    print(resp)
    print(resp.text)
