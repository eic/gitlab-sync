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
  # Recreate local branches from origin/* so --prune has a stable source side
  # (GitHub Actions checkout is normally detached HEAD, and origin/HEAD is
  # not a valid branch name on the target).
  git for-each-ref --format='%(refname:strip=3)' refs/remotes/origin/ \
    | grep -vE '^HEAD$' \
    | while read -r b; do git branch -f "$b" "refs/remotes/origin/$b"; done
  git push -f ${INPUT_CISKIP:+-o ci.skip} --all ${INPUT_REMOTE}
  git push -f --prune ${INPUT_REMOTE} "refs/heads/*:refs/heads/*"
  git push -f --tags ${INPUT_REMOTE}
    ;;
delete)
  git-setup
  git push -d ${INPUT_REMOTE} "${GITHUB_EVENT_REF}"
    ;;
*)
  #break
esac

