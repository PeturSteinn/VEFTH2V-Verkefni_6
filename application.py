import os
import json
import requests
from bottle import route, run, static_file, error, request, template, TEMPLATES


@route('/static/<filename:path>')
def server_static(filename):
    return static_file(filename, root='./resources')


response = requests.get("http://apis.is/petrol")

data = response.json()
all_stations = list()
odyrt_diesel = dict()
odyrt_bensin = dict()

for i in data['results']:
    i['bensin95'] = str(i['bensin95'])
    i['diesel'] = str(i['diesel'])
    i['bensin95_discount'] = str(i['bensin95_discount'])
    i['diesel_discount'] = str(i['diesel_discount'])
    if i['bensin95_discount'] == "None":
        i['bensin95_discount'] = "Ekkert"
    else:
        i['bensin95_discount'] += " kr,-"
    if i['diesel_discount'] == "None":
        i['diesel_discount'] = "Ekkert"
    else:
        i['diesel_discount'] += " kr,-"
    i['bensin95'] += " kr,-"
    i['diesel'] += " kr,-"
for i in data['results']:
    add_stod = True
    for j in all_stations:
        if i['company'] == j['company']:
            add_stod = False

    if add_stod:
        all_stations.append(i)

for j, i in enumerate(data['results']):
    if j == 0:
        odyrt_bensin = i
        odyrt_diesel = i

    if i['bensin95'] < odyrt_bensin['bensin95']:
        odyrt_bensin = i

    if i['diesel'] < odyrt_diesel['diesel']:
        odyrt_diesel = i

lastPriceCheck = data['timestampPriceCheck']
lastPriceCheck = lastPriceCheck.split(".")
lastPriceCheck.pop()
tmp = lastPriceCheck[0]
tmp = tmp.split("T")
lastPriceCheck = tmp


#user_request = 'olís'.title()
# for i in data['results']:
#    if i['company'] == user_request:
#        print(i)


@route('/')
def index():
    return template('views/index', all_stations = all_stations, odyrt_bensin = odyrt_bensin,
                    odyrt_diesel = odyrt_diesel, lastPriceCheck = lastPriceCheck)


@route('/about')
def about():
    return template('views/about')


@route('/stodvar')
def stodvar():
    return template('views/stodvar', all_stations = all_stations)

@route('/stod/<n>')
def stod(n):
    doesExist = False
    stod = list()
    for i in data['results']:
        if i['company'].lower() == n.lower():
            doesExist = True
            stod.append(i)

    if doesExist:
        return template('views/stod', stod = stod, lastPriceCheck = lastPriceCheck)
    else:
        return template('views/error404')

@error(404)
def error404(error):
    return template('views/error404')


#run(host="0.0.0.0", port=os.environ.get('PORT'))
run(debug=True, reloader=True)