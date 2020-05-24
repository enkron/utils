#!/usr/bin/env python3

import json
import logging
import os
import zipfile
import zlib
import boto3
from botocore.exceptions import ClientError
import requests
import sys


def get_lambda_arn(lambda_name):
    """Retrieve the ARN of a Lambda function

    :param lambda_name: Name of Lambda function
    :return: String ARN of Lambda function. If error, returns None.
    """

    # Retrieve information about the Lambda function
    lambda_client = boto3.client('lambda')
    try:
        response = lambda_client.get_function(FunctionName=lambda_name)
    except ClientError as e:
        logging.error(e)
        return None
    return response['Configuration']['FunctionArn']

def main():
    get_lambda_arn(sys.argv[1])


if __name__ == '__main__': main()
