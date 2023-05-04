# gitlab-sync
[![Build](https://github.com/kroese/gitlab-sync/workflows/Build/badge.svg)](https://github.com/kroese/gitlab-sync/)
[![Version](https://img.shields.io/github/v/tag/kroese/gitlab-sync?label=version&color=066da5)](https://github.com/kroese/gitlab-sync/)
[![Size](https://img.shields.io/github/languages/code-size/kroese/gitlab-sync?label=size&color=066da5)](https://github.com/kroese/gitlab-sync/)

Action to synchronize code to GitLab.

## Usage

You can use the following example as a template to create a new file with any name under `.github/workflows/`.

```yaml
name: <action-name>

on: 
  - push
  - delete

jobs:
  sync:
    runs-on: ubuntu-latest
    name: Gitlab Sync
    steps:
    - uses: actions/checkout@v2
      with:
        fetch-depth: 0
    - uses: kroese/gitlab-sync@v1
      with:
        # Such as https://github.com/kroese/gitlab-sync.git
        target-url: <target-url>
        # Such as wangchucheng
        target-username: <target-username>
        # You can store token in your project's 'Setting > Secrets' and reference the name here. Such as ${{ secrets.ACCESS_TOKEN }}
        target-token: <target-token>
```
