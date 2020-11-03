# ai-ethan
Twitter bot that posts tweets similar to those of @h3h3productions.

Inspired by https://filiph.github.io/markov/.

Uses [twint](https://github.com/twintproject/twint) to gather all of @h3h3productions tweets and the twitter api to post tweets.

I have the bot running on an ubuntu VM set with the following crontab file:

```
0 */3 * * * dart /ai-ethan/main.dart >> /dev/null 2>&1
0 0 * * 0 sudo rm -f /ai-ethan/tweets.txt && twint -u h3h3productions -ho -o /ai-ethan/tweets.txt --format {tweet} && python3 /ai-ethan/clean_tweets.py >> /dev/null 2>&1
```

The first cronjob is to post a tweet every 3 hours, the second is to gather @h3h3productions tweets once per week.

I made this repo public in case you have interest in making a similar bot 😊
