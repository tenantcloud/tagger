#!/usr/bin/env bash

source=${SOURCE:-.}

cd "${GITHUB_WORKSPACE}"/"${source}" || exit

echo "*** Start tagger ***"

NEW_GIT_TAG=$(tcctl helpers generate_increment_version)

echo "The new tag is: $NEW_GIT_TAG"

remote=$(git config --get remote.origin.url)
repo=$(basename "$remote" .git)
commit=$(git rev-parse HEAD)

curl -s -X POST https://api.github.com/repos/"$REPO_OWNER"/"$repo"/git/refs \
-H "Authorization: token $GITHUB_TOKEN" \
-d @- << EOF
{
  "ref": "refs/tags/$NEW_GIT_TAG",
  "sha": "$commit"
}
EOF

echo "*** Finish ***"
