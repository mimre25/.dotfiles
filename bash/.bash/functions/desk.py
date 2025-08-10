#!python
import requests

import sys


STAND_HEIGHT = 93
WALK_HEIGHT = 99
SIT_HEIGHT = 60.2
BALL_HEIGHT = 63.5
MIN_HEIGHT = 58.45
MAX_HEIGHT = 118.74


MODES = {
    "stand": STAND_HEIGHT,
    "sit": SIT_HEIGHT,
    "max": MAX_HEIGHT,
    "min": MIN_HEIGHT,
    "ball": BALL_HEIGHT,
    "walk": WALK_HEIGHT,
}


mode = sys.argv[1]

if mode in MODES:
    height = MODES[mode]
else:
    try:
        height = float(mode)
    except:
        raise Exception(f"Unknown Mode {mode}")


resp = requests.post(
    f"http://megadesk.local/number/megadesk_height__cm_/set?value={height}"
)

if resp.status_code != 200:
    print(resp)
    print(resp.text)
