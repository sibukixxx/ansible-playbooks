#!/bin/bash

#set -x
set -eu
# http://qiita.com/kotarella1110/items/79af4485bd7985935d6b
## 
## ansibleを始める時の基本ディレクトリを作成
##

## 関数読み込み
source functions/makeRole.bash

## 初期変数
declare root_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
declare common_playbook=common_playbook
declare common_roles_dir=$root_directory/$common_playbook/roles

declare common_playbook_template="
            vars
            roles
"
declare roles_template="
            tasks
            handlers
            templates
            files
            defaults
"


## 共用playbook 配置ディレクトリ構築
if [ ! -d ${common_playbook}  ]; then
    mkdir -p ${common_playbook} ; cd $_

    # 初期ディレクトリ作成
    for dir in $common_playbook_template
    do
        mkdir  $dir
        echo  "SUCCESS： mkdir $common_playbook/$dir"
    done

    # 初期commonディレクトリ作成
    cd $common_roles_dir
    mkdir common

    for role_dir in $roles_template
    do
        mkdir common/$role_dir
        touch common/$role_dir/main.yml
        echo  "SUCCESS： mkdir $common_playbook/common/$role_dir"
    done
fi

## 使い方： ./start.sh make_role php
if [ $1 == 'make_role' ]; then

    if [ $# == 2 ]; then
        role_name=$2
        make_role_template $2
    fi
fi




