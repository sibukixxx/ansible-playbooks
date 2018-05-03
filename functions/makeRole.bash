# サービス全ての共用のrolesを作成する
function make_role_template  {

    # /common_playbook/roles/
    cd $common_roles_dir
    mkdir $role_name

    for role_dir in $roles_template
    do
        mkdir  $role_name/$role_dir
        echo  "SUCCESS： mkdir  $role_name/$role_dir"
    done
}
