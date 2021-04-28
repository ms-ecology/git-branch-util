#!/bin/bash
# $0 file 
# $1 c, m or d, create, merge & destroy
# $2 name, render as feat-name
# $3 commit text

if [ $1 == 'c' ];then
  git checkout master
  if [ $? == 1 ];then
    echo "can't find branch 'master', maybe your main branch name is 'main', retrying..."
    git checkout main
  fi
  git pull
  git checkout -b $2
  git push --set-upstream origin $2
fi

if [ $1 == 'm' ];then
  FEATURE=`git branch -a|grep '.*\*'|sed 's/[*[:space:]]*//g'`
  git add .
  STATUS=`git status --porcelain`
  if [ -z "$STATUS" ]; then
    echo "已是最新内容,无需提交"
  else
    ms commit
  fi
  
  STATUS=`git status --porcelain` #提交完成后再次确认status
  if [ -z "$STATUS" ]; then
    git push
    git checkout $2
    git pull
    git merge $FEATURE --no-ff -m "Merge branch '$FEATURE' into '$2'"
    git push
  else
    echo '存在尚未提交的更改,请检查git status,已终止合并' #退出合并脚本
  fi
fi

if [ $1 == 'd' ];then
  git checkout master
  if [ $? == 1 ];then
    echo "can't find branch 'master', maybe your main branch name is 'main', retrying..."
    git checkout main
  fi
  git branch -d $2
  git push origin --delete $2
fi
