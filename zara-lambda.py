def lambda_handler(event, context):
    """
    Basic Lambda Handler
    Returns the message from the query string parameters

    """
    print(event)
    try:
        name = str(event['queryStringParameters']['name'])
        amount = float(event['queryStringParameters']['amount'])
        percentage = float(event['queryStringParameters']['percentage'])
        answer = (amount * percentage) / 100
        return {
            'statusCode':
            200,
            'body':
            "Hello, " + (name) + " " + str(percentage) + " percent of " +
            str(amount) + " is " + str(answer)
        }

    except KeyError:
        message = 'No message found'
        return {'statusCode': 200, 'body': message}