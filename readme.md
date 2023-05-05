# gitlab-sync
[![Build](https://github.com/action-pack/gitlab-sync/workflows/Build/badge.svg)](https://github.com/action-pack/gitlab-sync/)
[![Version](https://img.shields.io/github/v/tag/action-pack/gitlab-sync?label=version&color=066da5)](https://github.com/action-pack/gitlab-sync/)
[![Size](https://img.shields.io/github/languages/code-size/action-pack/gitlab-sync?label=size&color=066da5)](https://github.com/action-pack/gitlab-sync/)

Action to mirror a repository to GitLab.

## Usage

```yaml
name: Gitlab Sync

on:
  push:
    branches:
    - main

jobs:
  sync:
    name: Gitlab Sync
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        fetch-depth: 0
     - uses: action-pack/gitlab-sync@v2
      with:
        #url: ${{ secrets.GITLAB_URL }}
        url: https://gitlab.com/${{ github.repository }}.git
        #username: ${{ secrets.GITLAB_USERNAME }}
        username: ${{ github.actor }}
        # Personal access token from gitlab.com 
        token: ${{ secrets.GITLAB_TOKEN }}
```
