#!/usr/bin/python3
""" 0. Gather data from an API """

import json
from sys import argv

import requests

if __name__ == '__main__':

    url = 'https://jsonplaceholder.typicode.com/users'
    users = requests.get(url).json()
    #create dictionary
    content = {}
    for user in users:
        url2 = 'https://jsonplaceholder.typicode.com/todos'
        values = {'userId': user.get('id')}
        tasks = requests.get(url2, params=values).json()
        content[user.get('id')] = [{
                "task": task.get('title'),
                "completed": task.get('completed'),
                "username": user.get('username')} for task in tasks]

    file = 'todo_all_employees.json'
    with open(file, 'w') as jsonfile:
        json.dump(content, jsonfile)
