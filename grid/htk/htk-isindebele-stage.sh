#!/bin/bash
# CODE-RADE HTK Data Staging
# Author : Bruce Becker
#        : https://github.com/brucellino
#        : CSIR Meraka
# ########################################
# See the README.md in the repo
# This script runs a simple check to see if
#  We can stage some HTK data from UJ
# it is a standalone script to be used with exmaple 2
# ########################################
curl -X POST --data-urlencode 'payload={"channel": "#gridjobs", "username": "gridjob", "text": "HTK running on '"$HOSTNAME"'. starting data chunk '"$2"' with Repo '"$1"' ", "icon_emoji": ":labtocat:"}' https://hooks.slack.com/services/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
# Taking from the "system.sh" script in ASR, we first set up the workind dirs :
export DIR_EXP=$PWD

for dir in $DIR_EXP/data/mfccs $DIR_EXP/log $DIR_EXP/data/proc_trans $DIR_EXP/lists/ $DIR_EXP/data/audio ; do
  mkdir -p $dir
done
ls $DIR_EXP

# Put the data into $DIR_EXP/data/audio
# We will use just one chunk - this is passed as the argument
echo "Is the chunk here  ? "
ls -lht
echo "looking for the data here"
find . -name "inindebele_001.tar.gz"
tar xvfz isindebele_$2.tar.gz -C $DIR_EXP/data/audio/

echo "size of the data is "
du -chs $DIR_EXP/data/audio

curl -X POST --data-urlencode 'payload={"channel": "#gridjobs", "username": "gridjob", "text": "Data chunk '"$2"' finishing on '"$HOSTNAME"'. :wave::skin-tone-6:  ", "icon_emoji": ":labtocat:"}' https://hooks.slack.com/services/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

exit 0;
