# jacobsanford/slack-hodor
Docker container : leverages [python-rtmbot](https://github.com/slackhq/python-rtmbot) and [python-rtmbot-hodor](https://github.com/JacobSanford/python-rtmbot-hodor) to listen for mentions of Hodor's name in a Slack channel and replies with a message.

Messages are pre-defined from a basic module import and classified by mood.

The 'mood' of reply is determined by comparing the content of the triggering message against a library of words and human interpreted intent scoring. After mood assignment, a message is chosen based on a 'item drop' type selection process that allows for weighting of responses.

## Docker
A [docker image](https://registry.hub.docker.com/u/jacobsanford/slack-hodor//) has been created to deploy this service quickly.

## Usage
```
docker run \
       --rm \
       --name hodorbot \
       -e SLACK_TOKEN=<BOT_TOKEN_OBTAINED_FROM_SLACK_INTEGRATION> \
       jacobsanford/slack-hodor
```

## License
- Slack Hodor Integration is licensed under the MIT License:
  - http://opensource.org/licenses/mit-license.html
- Attribution is not required, but much appreciated:
  - `Slack Hodor Integration by Jacob Sanford`

## Sources
- Mood is chosen based on a dataset 'AFINN' generated by Finn Arup Nielsen in 2009-2011 and used under the "Open Database License (ODbL) v1.0". [http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010](http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010)