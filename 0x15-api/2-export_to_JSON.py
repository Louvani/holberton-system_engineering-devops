#!/usr/bin/python3
""" 0. Gather data from an API """

import json
from sys import argv

import requests

if __name__ == '__main__':

    employee_ID = argv[1]

    url = 'https://jsonplaceholder.typicode.com/todos'
    values = {'userId': employee_ID}
    tasks = requests.get(url, params=values).json()

    url2 = 'https://jsonplaceholder.typicode.com/users'
    values = {'id': employee_ID}
    user = requests.get(url2, params=values).json()
    content = {'2': [
            {"username": user[0]['username'],
                "completed": task.get('completed'),
                "task": task.get('title')} for task in tasks]}

    file = employee_ID + '.json'
    with open(file, 'w') as jsonfile:
        json.dump(content, jsonfile)
