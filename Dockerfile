FROM node
MAINTAINER endo

RUN npm install -g yo generator-hubot
RUN npm list -g yo generator-hubot
RUN useradd bot
RUN mkdir /home/bot && chown bot.bot /home/bot

USER bot
WORKDIR /home/bot

RUN yo hubot --owner "endo" --name "dobot" --description "welcome bot" --adapter slack
# ここでY/n 聞かれるのが、待ってると自動的にYesと回答する仕様になっている

# welcomeScriptの導入
RUN echo '[\n  "hubot-diagnostics",\n  "hubot-help",\n  "hubot-heroku-keepalive",\n  "hubot-google-images",\n  "hubot-google-translate",\n  "hubot-pugme",\n  "hubot-maps",\n  "hubot-redis-brain",\n  "hubot-rules",\n  "hubot-slack-welcome",\n  "hubot-shipit"\n]' > external-scripts.json
RUN echo '{\n  "name": "bot",\n  "version": "0.0.0",\n  "private": true,\n  "author": "doSlack",\n  "description": "welcome bot",\n  "dependencies": {\n    "hubot": "^2.19.0",\n    "hubot-diagnostics": "0.0.2",\n    "hubot-google-images": "^0.2.7",\n    "hubot-google-translate": "^0.2.1",\n    "hubot-help": "^0.2.2",\n    "hubot-heroku-keepalive": "^1.0.3",\n    "hubot-maps": "0.0.3",\n    "hubot-pugme": "^0.1.1",\n    "hubot-redis-brain": "0.0.4",\n    "hubot-rules": "^0.1.2",\n    "hubot-scripts": "^2.17.2",\n    "hubot-shipit": "^0.2.1",\n    "hubot-slack-welcome": "git://github.com/knjcode/hubot-slack-welcome",\n    "hubot-slack": "^4.4.0"\n  },\n  "engines": {\n    "node": "0.10.x"\n  }\n}' > package.json
RUN rm -f hubot-scripts.json

# 環境変数の設定
ENV PORT=20080
ENV HUBOT_SLACK_WELCOME_MESSAGE="HOGEのDockerfileslackへようこそ。\n初めて参加された方は、アイコンの設定とProfile欄に所属と仕事内容の紹介をお願いします :bow:"

CMD bin/hubot --adapter slack
