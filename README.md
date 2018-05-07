# welcome-bot

## build
```
docker build -t welcome-hubot .
```

## run
`docker run --rm -itd -v /etc/localtime:/etc/localtime:ro -p 20080:20080 -e HUBOT_SLACK_TOKEN={YOUR SLACK TOKEN e.g. xoxo-hogehuga} -e HUBOT_SLACK_WELCOME_TARGET_CHANNEL=general --name "welcomeHubot" welcome-hubot`

