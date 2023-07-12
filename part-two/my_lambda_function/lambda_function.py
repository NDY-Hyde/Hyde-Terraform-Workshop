def lambda_handler(event, context):
    """
    Basic Lambda Handler
    Returns the message from the query string parameters

    """
    try:
        message = event['queryStringParameters']['message']
        return {'statusCode': 200, 'body': message}
    except KeyError:
        message = 'No message found'
        return {'statusCode': 200, 'body': message}