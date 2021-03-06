# jacobsanford/slack-hodor [![](https://images.microbadger.com/badges/image/jacobsanford/slack-hodor:latest.svg)](http://microbadger.com/images/jacobsanford/slack-hodor:latest "Get your own image badge on microbadger.com")
Docker image : leverages [python-rtmbot](https://github.com/slackhq/python-rtmbot) and [python-rtmbot-hodor](https://github.com/JacobSanford/python-rtmbot-hodor) to monitor mentions of Hodor's name in a Slack channel and reply with a message:

![alt text](https://raw.githubusercontent.com/JacobSanford/docker-slack-hodor/master/media/hodor_image_1.png "Hodor in Action")

Hodor's replies are [determined by mood](https://github.com/JacobSanford/python-rtmbot-hodor/blob/master/Hodor/HodorActions.py).

The 'mood' of reply is determined by comparing the content of the triggering message against a library of words and human interpreted intent scoring. After mood assignment, a message is chosen based on a 'item drop' type selection process that allows for weighting of responses.

## Quick Start
1. [Add a bot user](https://api.slack.com/bot-users) to your slack team and obtain the API token.
2. Deploy the image, passing to it the API token in the ```SLACK_TOKEN``` environment variable:
```
docker run \
       --rm \
       --name hodorbot \
       -e SLACK_TOKEN=_API_TOKEN_OBTAINED_FROM_SLACK_INTEGRATION_ \
       jacobsanford/slack-hodor
```

## License
- Slack Hodor Integration is licensed under the MIT License:
  - http://opensource.org/licenses/mit-license.html
- Attribution is not required, but much appreciated:
  - `Slack Hodor Integration by Jacob Sanford`

## Sources
- Mood is chosen based on a dataset 'AFINN' generated by Finn Arup Nielsen in 2009-2011 and used under the "Open Database License (ODbL) v1.0". [http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010](http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010)
