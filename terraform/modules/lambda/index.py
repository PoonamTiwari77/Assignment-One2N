import json
import boto3
from botocore.exceptions import ClientError

s3_client = boto3.client('s3')

def list_s3_objects(bucket_name, prefix=''):
    try:
        response = s3_client.list_objects_v2(Bucket=bucket_name, Prefix=prefix, Delimiter='/')
        
        directories = []
        files = []

        if 'CommonPrefixes' in response:
            for common_prefix in response['CommonPrefixes']:
                dir_name = common_prefix['Prefix'].strip('/').split('/')[-1]
                directories.append(dir_name)

        if 'Contents' in response:
            for obj in response['Contents']:
                file_name = obj['Key'].split('/')[-1]
                if file_name:  # Only add non-empty names
                    files.append(file_name)
        
        return {
            'directories': directories,
            'files': files
        }
    except ClientError as e:
        print(f"Error listing objects in bucket {bucket_name}: {e}")
        return None

def lambda_handler(event, context):
    bucket_name = event['pathParameters']['bucket']
    path = event['pathParameters'].get('path', '')

    result = list_s3_objects(bucket_name, prefix=path)

    if result is None:
        return {
            'statusCode': 404,
            'body': json.dumps({'error': 'Bucket or path not found'})
        }
    
    return {
        'statusCode': 200,
        'body': json.dumps({
            'content': result['directories'] + result['files']
        })
    }
