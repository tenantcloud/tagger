#!/usr/bin/env bash

source=${SOURCE:-.}

cd "${GITHUB_WORKSPACE}"/"${source}" || exit

tcctl message --text "Start tagger"

NEW_GIT_TAG=$(tcctl helpers generate_increment_version)

tcctl message --text "The new tag is: $NEW_GIT_TAG"

tcctl helpers push_new_version --tag "$NEW_GIT_TAG"

tcctl message --text "Finish"
