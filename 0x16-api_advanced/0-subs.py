#!/usr/bin/python3
"""
number_of_subscribers
"""
import requests


def number_of_subscribers(subreddit):
    '''returns the number of subscribers for a given subreddit.'''

    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    response = requests.get(url)

    if response.status_code != 200:
        return 0
    req = response.json()
    return req['data']['subscribers']
