#! /bin/python

import requests
import json
import subprocess

APIKEY = '3e321f9414eaedbfab34983bda77a66e'
CITY = "Moscow"
MODE ="json"
UNITS = "metric"

url = f'https://api.openweathermap.org/data/2.5/weather?q={CITY}&appid={APIKEY}&mode={MODE}&units={UNITS}'
# print(url)

class ParsedObject:
    def __init__(self, d):
        self.city = d['name']


        weather = d['weather'][0]
        self.weather = weather['main']
        self.weather_description = weather['description']

        self.temp = d['main']['temp']
        self.temp2 = d['main']['feels_like']

        self.temp = round(self.temp, 1)
        self.temp2 = round(self.temp2, 1)

        self.clouds = d['clouds']['all']
        self.sun_times = [
            int(d['sys']['sunrise']),
            int(d['sys']['sunset']),
        ]

    def __str__(self):
        return f'{self.city}: {self.weather}, {self.temp}'

    def bar(self):
        return f'{self.weather}, {self.temp} ({self.temp2}), {self.clouds}%'


def main():
    response = requests.get(url)
    res = json.loads(response.text)

    # print(res)

    obj = ParsedObject(res)
    print(obj.bar())

try:
    main()
except Exception as e:
    pass
    # print(e)
