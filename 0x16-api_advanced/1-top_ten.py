#!/usr/bin/python3
"""
1. Top Ten
"""
import requests


def top_ten(subreddit):
    '''prints the titles of the first 10 hot posts
    listed for a given subreddit.'''
    url = 'https://www.reddit.com/r/{}/hot.json?limit=10'.format(subreddit)

    headers = {"User-Agent": "lou"}
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200:
        print('None')
    else:
        req = response.json()
        for item in req['data']['children']:
            print(item['data']['title'])
