# aws-assume-role-action
[![Actions Status](https://github.com/abatilo/aws-assume-role-action/workflows/assume-role/badge.svg)](https://github.com/abatilo/aws-assume-role-action/actions)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=abatilo/aws-assume-role-action)](https://dependabot.com)
[![Docker
pulls](https://img.shields.io/docker/pulls/abatilo/aws-assume-role-action.svg)](https://hub.docker.com/r/abatilo/aws-assume-role-action)
[![Latest
release](https://img.shields.io/github/v/release/abatilo/aws-assume-role-action?include_prereleases)](https://github.com/abatilo/aws-assume-role-action/releases)
[![License](https://img.shields.io/github/license/abatilo/aws-assume-role-action)](https://github.com/abatilo/aws-assume-role-action/blob/master/LICENSE)
[![DockerHub image size](https://images.microbadger.com/badges/image/abatilo/aws-assume-role-action.svg)](https://microbadger.com/images/abatilo/aws-assume-role-action "Get your own image badge on microbadger.com")

A GitHub Action which sets your AWS environment variables so that it can assume a role.

Example usage
```yaml
on: push
name: assume-role
jobs:
  assume-role:
    name: Assume Role
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Assume Role
      uses: ./
      env:
        ROLE_ARN: arn:aws:iam::717012417639:role/sts-action-tester-role
        ROLE_SESSION_NAME: testing
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        # Optional: Defaults to 3600
        DURATION_SECONDS: 900
    - name: Identity Check
      run: |
        aws sts get-caller-identity
  use-published-action:
    name: Assume Role with GitHub Marketplace action
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Assume Role
      uses: abatilo/aws-assume-role-action@v1.0.0
      env:
        ROLE_ARN: arn:aws:iam::717012417639:role/sts-action-tester-role
        ROLE_SESSION_NAME: testing
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        # Optional: Defaults to 3600
        DURATION_SECONDS: 900
    - name: Identity Check
      run: |
        aws sts get-caller-identity
  use-dockerhub-action:
    name: Assume Role with DockerHub action
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Assume Role
      uses: docker://abatilo/aws-assume-role-action:v1.0.0
      env:
        ROLE_ARN: arn:aws:iam::717012417639:role/sts-action-tester-role
        ROLE_SESSION_NAME: testing
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        # Optional: Defaults to 3600
        DURATION_SECONDS: 900
    - name: Identity Check
      run: |
        aws sts get-caller-identity
```
