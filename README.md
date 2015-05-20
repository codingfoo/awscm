awscm
=====

Provide a way to manage and switch between multiple aws credentials


Install
=======
Clone to install
```
git clone git@github.com:codingfoo/awscm.git ~/.awscm
```

Add the following to .bashrc or equivalent shell startup file
```
# AWSCM ###
test -f "$HOME/.awscm/bashrc" && . "$HOME/.awscm/bashrc"
```

Usage
=====
Switch credentials
```
awscm <name>
```

What is the problem awscm is trying to solve?
===============================================
Manage AWS credentials for multiple accounts

Allow different sets of credentials to be used in different shells

Avoid leaking creds in environment vars where possible


Rationale
=========
Three approaches to managing AWS config vars:

Environment variables

Directory managed by git for switching to different branches for each set of credentials

Combination of Environment vars and profile


Environment variable approach

pros: able to use different accounts in different tabs

cons: must modify bashrc for function to be able to change vars

Git approach

pros: not required to change the bashrc, more secure to use files

cons: only allows using one account at a time

Best approach is to use combination of environment vars and new profile file used by aws-cli tool. The environment var is just the selected profile.

On AWS ec2 instances best practice is to use the iam instance roles. So use an approach where the keys are not specified directly in the code.

It has to be a function sourced into bashrc as a binary cannont manipulate the environment of another environment


Todo
====
create awscm-add

set/check restricted permissions on new files

add check around setting ssh-add pem

set credentials for heroku instances

auto switch environments(which approach? shim vs integrate with rvm)


Notes
=====
Use aws-cli where possible

rather than encrypt the file and prevent the sdk from accessing use whole disk encryption

At the top of scripts place a call to set the correct keys
