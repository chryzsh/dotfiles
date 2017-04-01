#!/bin/python

import urllib.request, json

city = "Oslo"
api_key = "e07d3e3bacb73e37684bca782b71bd02"

weather = eval(str(urllib.request.urlopen("http://api.openweathermap.org/data/2.5/weather?q={}&APPID={}".format(city, api_key)).read())[2:-1])

#info = weather["weather"][0].capitalize()
info = weather["weather"][0]["description"].capitalize()
temp = int(float(weather["main"]["temp"]) - 272.15)

print("%i°C" % (temp))
#print("%s, %i °C" % (info, temp))
