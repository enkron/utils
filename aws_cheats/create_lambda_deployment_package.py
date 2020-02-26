#!/usr/bin/env python3

import logging
import zipfile
import zlib
import sys



def create_lambda_deployment_package(srcfile, deployment_package):
    """Create a Lambda deployment package (ZIP file)

    :param srcfile: Lambda function source file
    :param deployment_package: Name of generated deployment package
    :return: True if deployment package created. Otherwise, False.
    """

    # Create the deployment package
    with zipfile.ZipFile(deployment_package, mode='w',
                         compression=zipfile.ZIP_DEFLATED,
                         compresslevel=zlib.Z_DEFAULT_COMPRESSION) as deploy_pkg:
        try:
            deploy_pkg.write(srcfile)
        except Exception as e:
            logging.error(e)
            return False
    return True

def main():
    create_lambda_deployment_package(sys.argv[1], sys.argv[2])


if __name__ == '__main__': main()
