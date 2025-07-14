const {GlueClient, StartCrawlerCommand} = require('@aws-sdk/client-glue');
const response = require('./cfn-response');

exports.handler = function(event, context, callback) {
    if (event.RequestType === 'Delete') {
        response.send(event, context, response.SUCCESS);
    } else {
        const glue = new GlueClient({});
        const command = new StartCrawlerCommand({Name: 'AWSCURCrawler-Landing_Zone'});
        glue.send(command).then((data) => {
            const responseData = { msg: 'Crawler started successfully' };
            if (event.ResponseURL) {
                response.send(event, context, response.SUCCESS, responseData);
            } else {
                callback(null, responseData);
            }
        }).catch((err) => {
            if (err) {
                const responseData = JSON.parse(JSON.stringify(err));
                if (responseData['__type'] === 'CrawlerRunningException') {
                    callback(null, responseData.Message);
                } else {
                    const responseString = JSON.stringify(responseData);
                    if (event.ResponseURL) {
                        response.send(event, context, response.FAILED, { msg: responseString });
                    } else {
                        callback(responseString);
                    }
                }
            } else {
                if (event.ResponseURL) {
                    response.send(event, context, response.SUCCESS);
                } else {
                    callback(null, response.SUCCESS);
                }
            }
        });
    }
};