#!/usr/bin/python3
"""
2. Recurse it!
"""
import requests


def recurse(subreddit, hot_list=[], after=""):
    '''prints the titles of the first 10 hot posts
    listed for a given subreddit.'''
    if len(hot_list) == 0:
        url = 'https://www.reddit.com/r/{}/hot.json?limit=1'.format(subreddit)
    else:
        if after is None:
            return hot_list
        url = 'https://www.reddit.com/r/{}/hot.json?limit=1&after={}'.format(
            subreddit, after)

    headers = {"User-agent": "lou"}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code != 200:
        return None
    else:
        req = response.json()
        hot_list.append(req['data']['children'][0]['data']['title'])
        recurse(subreddit, hot_list, req['data']['after'])
