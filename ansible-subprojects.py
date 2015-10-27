#!/usr/bin/env python

import os
from subprocess import call

ansible_playbooks_dir = "/Users/drew/git/github/andrewrothstein/ansible-playbooks"
ansible_playbooks_roles_dir = ansible_playbooks_dir + "/roles"
license_path = "/Users/drew/git/github/andrewrothstein/ansible-julia/LICENSE"
readme_path = "/Users/drew/git/github/andrewrothstein/ansible-julia/README.md"

def create_git_repo(role) :
    github_repos_dir = "/Users/drew/git/github-target"

    src_role_path = ansible_playbooks_roles_dir + "/" + role
    target_role_path = github_repos_dir + "/ansible-" + role

    if (not os.path.isdir(target_role_path)):
        print("copying role files from {0} to {1}...".format(src_role_path, target_role_path))
        call(['cp', '-R', src_role_path, target_role_path])
        call(['cp', license_path, target_role_path])
        call(['cp', readme_path, target_role_path])

    target_role_path_git_dir = target_role_path + "/.git"
    if (not os.path.isdir(target_role_path_git_dir)):
        print("initializing git in {0}...".format(target_role_path))
        os.chdir(target_role_path)
        call(['git', 'init'])
        call(['git', 'add', '.'])
        call(['git', 'commit', '-m', 'initial commit'])
        call(['hub', 'create', 'ansible-' + role])
        call(['git', 'push', 'origin', 'master'])

def chop_role(role) :
    role_path = 'roles/' + role
    github_remote = 'git://github.com/andrewrothstein/ansible-' + role + '.git'
    print("chopping {0} from {1} and linking to {2}...".format(role_path, ansible_playbooks_dir, github_remote))

    os.chdir(ansible_playbooks_dir)
    call(['git', 'rm', '-rf', role_path])
    call(['git', 'commit', '-a', '-m', 'migrating to galaxified role ansible-' + role])
    call(['git', 'submodule', 'add', github_remote, role_path])
    call(['git', 'commit', '-a', '-m', 'add submodule for ansible-' + role])
    
        

all_roles = filter(lambda x : not os.path.isdir(x), os.listdir(ansible_playbooks_roles_dir))

skip = set(['julia', 'proxify'])
roles = filter(lambda x : x not in skip, all_roles)

#map(create_git_repo, roles)
print("all roles in {0}:".format(ansible_playbooks_roles_dir), all_roles)
print("roles:", roles)

map(chop_role, roles)
