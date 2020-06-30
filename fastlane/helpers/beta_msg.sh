#!/bin/bash

if [[ "${CI}" == 'true' ]] && [[ "${CIRCLECI}" == 'true' ]]
  then
    echo "
    branch ${CIRCLE_BRANCH} | build ${CIRCLE_BUILD_NUM}


    Details:
    this is successfull beta build with CircleCI
    project: ${CIRCLE_PROJECT_REPONAME}
    pr: ${CIRCLE_PULL_REQUEST}
    build log and artifacts are here: ${CIRCLE_BUILD_URL}

    commit:
    $( git show --oneline -s HEAD )
    "
  else
    echo "Manual build outside CircleCI"
fi
