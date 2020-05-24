#!/bin/bash

# this script represent simple ansible folders hierarchy.
# its structure was used in a specific work, so it has some difference
# from an official sample in the ansible documentation.

vars_envs='all production quality development'
role_dirs='tasks handlers templates files vars defaults meta library module_utils plugins'

mkdir -p ansible/inventory
touch ansible/site.yml
touch ansible/ansible.cfg

for env in ${vars_envs}; do
    if [[ ${env} == 'all' ]]; then
        mkdir -p ansible/group_vars/${env}
        touch ansible/group_vars/${env}/{vars,vault}
        continue
    fi
    touch ansible/inventory/${env}
    mkdir -p ansible/group_vars/${env}
    touch ansible/group_vars/${env}/{vars,vault}
done

for dir in ${role_dirs}; do
    mkdir -p ansible/roles/template/${dir}
    if [[ ${dir} == 'tasks' ]]    ||
       [[ ${dir} == 'handlers' ]] ||
       [[ ${dir} == 'vars' ]]     ||
       [[ ${dir} == 'defaults' ]] ||
       [[ ${dir} == 'meta' ]]; then
        touch ansible/roles/template/${dir}/main.yml
    fi
done

echo '[defaults]'                                  >> ansible/ansible.cfg
echo 'inventory           = ./inventory/'          >> ansible/ansible.cfg
echo 'host_key_checking   = False'                 >> ansible/ansible.cfg
echo 'vault_password_file = ~/.ansible/vault_file' >> ansible/ansible.cfg
echo 'retry_files_enabled = False'                 >> ansible/ansible.cfg
echo 'timeout             = 30'                    >> ansible/ansible.cfg
echo                                               >> ansible/ansible.cfg
echo '[ssh_connection]'                            >> ansible/ansible.cfg
echo 'pipelining          = True'                  >> ansible/ansible.cfg

