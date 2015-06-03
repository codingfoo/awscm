# awscm


Provide a way to manage and switch between multiple aws credentials. It will change the aws access and secret keys as well as load any ssh keys.


# Install

Clone to install
```
git clone git@github.com:codingfoo/awscm.git ~/.awscm
```

Add the following to .bashrc or equivalent shell startup file
```
# AWSCM ###
test -f "$HOME/.awscm/bashrc" && . "$HOME/.awscm/bashrc"
```

# Usage

Switch credentials
```
awscm <name>
```

# What is the problem awscm is trying to solve?

Manage AWS credentials for multiple accounts

Allow different sets of credentials to be used in different shells

Avoid leaking creds in environment vars where possible


# Rationale

Three approaches to managing and switching AWS config vars:

1. Environment variables

2. Directory managed by git for switching to different branches for each set of credentials

3. Combination of Environment vars and profile

### Environment variable approach

Pros:
  * able to use different accounts in different tabs

Cons:
  * must modify bashrc for function to be able to change vars

### Git approach

Pros:
  * not required to change the bashrc, more secure to use files

Cons:
  * only allows using one account at a time

Best approach is to use combination of environment vars and new profile file used by aws-cli tool. The environment var is just the selected profile.

On AWS ec2 instances best practice is to use the iam instance roles. So use an approach where the keys are not specified directly in the code.

It has to be a function sourced into bashrc as a binary cannot manipulate the environment of another environment


# Todo

* Create awscm-add
* Set/check restricted permissions on new files
* Commandline prompt display selected profile
* Set credentials for heroku instances
* Display list of credentials

# Notes

Use aws-cli where possible

At the top of scripts place a call to set the correct keys

Use whole disk encryption rather than encrypt the file and prevent the sdk from accessing it
