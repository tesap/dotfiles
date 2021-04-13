#! /bin/python3

import os, sys
import secrets
import string

# import pdb;pdb.set_trace()

args = list(filter(lambda x: os.path.basename(__file__) not in x, sys.argv))

chars_length = int(args[0])

printable = string.printable[:-5]
chars = ''.join([secrets.choice(printable) for i in range(chars_length)])

print(chars)
