import os

def deco():
    try:
        n = os.urandom(16)
        print(n)
        print(n.decode('utf-16'))
    except Exception as e:
        print(n)
        print(e)
        exit()

while True:
    deco()
