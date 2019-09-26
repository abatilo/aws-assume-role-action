#!/bin/sh

role_arn=$ROLE_ARN
role_session_name=$ROLE_SESSION_NAME
duration=${DURATION_SECONDS:-3600}

creds=$(aws sts assume-role \
  --role-arn $role_arn \
  --role-session-name $role_session_name \
  --duration-seconds $duration)

aws_access_key_id=$(echo $creds | jq -r '.Credentials.AccessKeyId')
aws_secret_access_key=$(echo $creds | jq -r '.Credentials.SecretAccessKey')
aws_session_token=$(echo $creds | jq -r '.Credentials.SessionToken')

echo ::add-mask::$aws_access_key_id
echo ::add-mask::$aws_secret_access_key
echo ::add-mask::$aws_session_token

echo ::set-env name=AWS_ACCESS_KEY_ID::$aws_access_key_id
echo ::set-env name=AWS_SECRET_ACCESS_KEY::$aws_secret_access_key
echo ::set-env name=AWS_SESSION_TOKEN::$aws_session_token
