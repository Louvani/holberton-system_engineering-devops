#!/usr/bin/python3
""" 0. Gather data from an API """

from sys import argv

import csv
import requests

if __name__ == '__main__':

    employee_ID = argv[1]

    url = 'https://jsonplaceholder.typicode.com/todos'
    values = {'userId': employee_ID}
    tasks = requests.get(url, params=values).json()

    url2 = 'https://jsonplaceholder.typicode.com/users'
    values = {'id': employee_ID}
    user = requests.get(url2, params=values).json()
    content = []
    for task in tasks:
        content.append([
            employee_ID,
            user[0]['username'],
            task.get('completed'),
            task.get('title')])

    file = employee_ID + '.csv'
    with open(file, 'w', newline='') as csvfile:
        sw = csv.writer(
            csvfile, delimiter=',', quoting=csv.QUOTE_ALL)
        sw.writerows(content)
