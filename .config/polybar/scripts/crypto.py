#!/usr/bin/env python3

import requests
from time import sleep

rounded = lambda x: round(x, 2)
insert_str = lambda s, i, x: s[:i] + x + s[i:]

api = 'https://api.coingecko.com/api/v3/coins'

currency = 'btc'
to_currency = 'usd'

try:
    r = requests.get(api).json()
except Exception:
    print(' Error')
    exit()

def get_currency(code, to_code, json):
    data = None

    for temp_data in json:
        if temp_data['symbol'] == code:
            data = temp_data

    if data is None:
        print('Not found!')
        return

    market_data = data['market_data']

    price = market_data['current_price'][to_code]
    change_24 = market_data['price_change_percentage_24h']
    change_7d = market_data['price_change_percentage_7d']
    change_14d = market_data['price_change_percentage_14d']

    return [
        price, 
        rounded(change_24), 
        rounded(change_7d),
        rounded(change_14d)
    ]


price, change_24h, change_7d, change_14d = get_currency(currency, to_currency, r)
signed_num = lambda x: ('+' if x > 0 else '') + str(x)

price = insert_str(str(rounded(price)), 2, ",")
signed_24h = signed_num(change_24h)
signed_7d = signed_num(change_7d)
signed_14d = signed_num(change_14d)
print(f'{price} | {signed_24h}% | {signed_7d}% | {signed_14d}%')
