
# Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.


import logging
logging.basicConfig(format='%(levelname)s: %(asctime)s: %(message)s')
logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    """Basic Lambda function template

    :param event: Dict (usually) of parameters passed to the function
    :param context: LambdaContext object of runtime data
    :return: Dict of key:value pairs
    """

    # Log that the function was invoked and the values received in the event
    # argument
    logger.info('Scheduled Lambda function was invoked')
    logger.info(f'Request event: {event}')

    # Construct response
    response = {'statusCode': 200}
    return response

