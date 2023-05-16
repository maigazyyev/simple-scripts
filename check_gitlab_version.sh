#! /bin/bash

export str1=`yum list | grep gitlab-ee | awk {'print $2'} | awk '(NR == 1)'`
export str2=`yum list | grep gitlab-ee | awk {'print $2'} | awk '(NR == 2)'`

if [ "$str1" != "$str2" ]; then
   curl -X POST -H 'Content-type: application/json' --data '{"text":"update Gitlab version to '$str2'"}' https://hooks.slack.com/services/$SECURE_SLACK_TOKEN checks every week in Sunday  if exists new version then sent notification to slack channel

# crontab -e 

# 0 19 * * SUN /root/gitlab_version_check.sh