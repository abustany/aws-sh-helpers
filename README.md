# aws-sh-helpers

Couple of Bash functions that make life easier when juggling between multiple
Amazon AWS accounts and having to rotate access keys on a regular basis.

## What's in the box

- awsaccount

`awsaccount` is a Bash function that sources AWS credentials in a running shell.
It use useful when switching between many accounts.

The credentials have to be in a file named `$HOME/.config/aws-credentials-NAME.conf`,
and can then be loaded in the environment by typing `awsaccount NAME`.

The content of the file should be in the form

```
AWS_ACCESS_KEY=XXXX
AWS_SECRET_KEY=YYYY
```

- rotate-aws-keys

`rotate-aws-keys` is a script that, for a given username in a given account,
rotates the AWS API keys by creating a new pair and deleting the old one. The
new credentials are saved in a file conforming to what `awsaccount` expects.

This script depends on `awsaccount`.

Example: `rotate-aws-keys myaccount myusername`

## Setup

Copy (or link) `aws-functions.sh` in `$HOME/.local/share/aws-functions.sh`, and
put `rotate-aws-keys` somewhere in your `PATH`.

Make sure you source `aws-functions.sh` in your shell (for example by editing
`$HOME/.bashrc`) if you want the `awsaccount` command to be available.
