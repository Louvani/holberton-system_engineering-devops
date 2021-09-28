#!/usr/bin/python3
"""
1. Top Ten
"""
import requests


def top_ten(subreddit):
    '''prints the titles of the first 10 hot posts
    listed for a given subreddit.'''
    url = 'https://www.reddit.com/r/{}/hot.json?limit=10'.format(subreddit)
    # values = {'limit': 10}
    response = requests.get(url)

    if response.status_code != 200:
        print('None')
    req = response.json()
    for item in req['data']['children']:
        print(item['data']['title'])
