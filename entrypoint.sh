#!/usr/bin/env bash
set -e

echo "${GITHUB_EVENT_NAME}"

function git-setup() {
  printf -v url "https://%s:%s@%s" \
    "${INPUT_TARGET_USERNAME}" \
    "${INPUT_TARGET_TOKEN}" \
    "${INPUT_TARGET_URL#https://}"
  echo "git remote add ${INPUT_REMOTE} ${url}"
  git remote add ${INPUT_REMOTE} "${url}"
  set -x
}

case "${GITHUB_EVENT_NAME}" in
push|create|pull_request|workflow_dispatch)
  git-setup
  git fetch --all
  git push -f ${INPUT_CISKIP:+-o ci.skip} --all ${INPUT_REMOTE}
  git push -f --prune ${INPUT_REMOTE}
  git push -f --tags ${INPUT_REMOTE}
    ;;
delete)
  git-setup
  git push -d ${INPUT_REMOTE} "${GITHUB_EVENT_REF}"
    ;;
*)
  #break
esac

