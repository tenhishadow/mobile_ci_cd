#!/bin/bash

# show output.json
for i in $( find android/app/build/outputs/apk/ -name output.json )
do
  echo "START output for ${i}"
  cat ${i} | jq
  echo "END output for ${i}"
done

# apkanalyzer
# according to https://developer.android.com/studio/command-line/apkanalyzer.html
for i in $( find android/app/build/outputs/apk/ -name *.apk  )
do
  echo "### REPORT for file ${i}"
  echo "## summary:" && apkanalyzer -h apk summary ${i}
  echo "## debugable: "&& apkanalyzer -h manifest debuggable ${i}
done
