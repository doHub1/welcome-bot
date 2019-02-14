# welcome-bot

## build
```
docker build -t welcome-bot-image .
```

## run
`docker run --rm -itd -v /etc/localtime:/etc/localtime:ro -p 20080:20080 -e HUBOT_SLACK_TOKEN={YOUR SLACK TOKEN e.g. xoxo-hogehuga} -e HUBOT_SLACK_WELCOME_TARGET_CHANNEL=general --name "welcome-bot" welcome-bot-image`

```
docker run --rm -itd -v /etc/localtime:/etc/localtime:ro -p 20080:20080 \
-e HUBOT_SLACK_TOKEN={YOUR SLACK TOKEN e.g. xoxo-FOOBAR} \
-e HUBOT_GOOGLE_CSE_ID={YOUR CSE_ID HERE} \
-e HUBOT_GOOGLE_CSE_KEY={YOUR CSE_KEY HERE} \
-e HUBOT_SLACK_WELCOME_MESSAGE='XXX slackへようこそ！
招待者の方はプロフ記入等のフォローお願いします。' \
-e ANY_OTHER_ENV=write_here \
--name "devo" devo-image
```


