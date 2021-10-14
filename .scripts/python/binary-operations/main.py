#! /bin/python3

import os, sys, secrets, string

try:
    args = list(filter(lambda x: os.path.basename(__file__) not in x, sys.argv))
except Exception:
    print('Provide int argument')
    exit()

n = int(args[0])

if len(args) > 1:
    printable = string.digits + string.ascii_letters
else:
    printable = string.printable[:-6]

print(''.join([secrets.choice(printable) for i in range(n)]))
