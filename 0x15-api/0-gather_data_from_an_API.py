#!/usr/bin/python3
""" 0. Gather data from an API """

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

    done_tasks = []
    try:
        for item in tasks:
            if item['completed'] is True:
                done_tasks.append(item['title'])
        print('Employee {} is done with tasks({}/{}):'.format(
            user[0]['name'], len(done_tasks), len(tasks)))
        for title in done_tasks:
            print('\t {}'.format(title))
    except IndexError:
        pass
