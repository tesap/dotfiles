import os
from bin_funcs import *


def deco():
    rand_bytes = random_bytes(1)
    try:
        print(rand_bytes.decode('utf-8'))
    except Exception as e:
        print('Exc', rand_bytes)
        print(e)
        # exit()


while True:
    deco()
