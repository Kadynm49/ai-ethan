import fileinput
import re

for line in fileinput.input('/home/erviewre/ai-ethan/tweets.txt', inplace=True):
  print('{}'.format(re.sub(r'http:\/\/t\.co\/[\d|\w]{5,10}', '', line)), end='')

for line in fileinput.input('/home/erviewre/ai-ethan/tweets.txt', inplace=True):
  print('{}'.format(re.sub(r'https:\/\/t\.co\/[\d|\w]{5,10}', '', line)), end='')

for line in fileinput.input('/home/erviewre/ai-ethan/tweets.txt', inplace=True):
  if (str.isspace(line)):
    print('', end='')
  else:
    print(line, end='')

for line in fileinput.input('/home/erviewre/ai-ethan/tweets.txt', inplace=True):
  print('{}'.format(re.sub(r'&lt;3', '❤️', line)), end='')
