# gitlab-sync
[![Build](https://github.com/kroese/gitlab-sync/workflows/Build/badge.svg)](https://github.com/kroese/gitlab-sync/)
[![Version](https://img.shields.io/github/v/tag/kroese/gitlab-sync?label=version&color=066da5)](https://github.com/kroese/gitlab-sync/)
[![Size](https://img.shields.io/github/languages/code-size/kroese/gitlab-sync?label=size&color=066da5)](https://github.com/kroese/gitlab-sync/)

Action to synchronize code to GitLab.

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
     - uses: kroese/gitlab-sync@v1
      with:
        #url: ${{ secrets.GITLAB_URL }}
        url: https://gitlab.com/${{ github.repository }}.git
        #username: ${{ secrets.GITLAB_USERNAME }}
        username: ${{ github.actor }}
        # Personal access token from gitlab.com 
        token: ${{ secrets.GITLAB_TOKEN }}
```
