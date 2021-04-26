#!/usr/bin/env bash

source=${SOURCE:-.}

cd "${GITHUB_WORKSPACE}"/"${source}" || exit

tcctl message --text "Start tagger"

tcctl run git config --global user.email "o.debretseni@tenantcloud.com"
tcctl run git config --global user.name "Oleh Debretseni"

NEW_GIT_TAG=$(tcctl helpers generate_increment_version)

tcctl message --text "The new tag is: $NEW_GIT_TAG"

tcctl helpers push_new_version --tag "$NEW_GIT_TAG"

tcctl message --text "Finish"
