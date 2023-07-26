import time
import random
import string
import sys
from Type_detector import Detector
#sys.path.append('/home/ubuntu/.local/lib/python3.10/site-packages/')
from PIL import Image, ImageOps
import json

import json
from PIL import Image
import sys

import json
from PIL import Image
import sys
import numpy as np

BASEPATH = "C:\\Users\\akilh\\OneDrive\\Bureau\\STAGE FH\\bricolini 2\\bricolini\\IA_MODEL\\"

def image_save(image, name):
    image = image.convert("RGB")
    image.save(name + ".jpg")

detector = Detector(BASEPATH)

if len(sys.argv) > 1:
    filename = sys.argv[1]
    result = detector.detect(filename)
    probabilities_list = result[0].tolist()

    obj = { "Garbage type": result[1], "probability distribution": probabilities_list }
    json_obj = json.dumps(obj)
    print(json_obj)
else:
    #print("Error: not enough argument !", file=sys.stderr)
    pass
