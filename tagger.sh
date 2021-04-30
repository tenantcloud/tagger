#!/usr/bin/env bash

source=${SOURCE:-.}

cd "${GITHUB_WORKSPACE}"/"${source}" || exit

tcctl message --text "Start tagger"

git config --global user.name "Oleh Debretseni"

git config --global user.email o.debretseni@tenantcloud.com

NEW_GIT_TAG=$(tcctl helpers generate_increment_version)

tcctl message --text "The new tag is: $NEW_GIT_TAG"

tcctl helpers push_new_version --tag "$NEW_GIT_TAG"

#remote=$(git config --get remote.origin.url)
#repo=$(basename "$remote" .git)
#commit=$(git rev-parse HEAD)
#
#curl -s -X POST https://api.github.com/repos/"$REPO_OWNER"/"$repo"/git/refs \
#-H "Authorization: token $GITHUB_TOKEN" \
#-d @- << EOF
#{
#  "ref": "refs/tags/$NEW_GIT_TAG",
#  "sha": "$commit"
#}
#EOF

tcctl message --text "Finish"
