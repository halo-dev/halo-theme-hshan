#!/bin/sh
#
 
git filter-branch --force --env-filter '
    if [ "$GIT_COMMITTER_NAME" = "meisen" ];
    then
        GIT_COMMITTER_NAME="hshanx";
        GIT_COMMITTER_EMAIL="hshanx@163.com";
        GIT_AUTHOR_NAME="hshanx";
        GIT_AUTHOR_EMAIL="hshanx@163.com";
    fi' -- --all
