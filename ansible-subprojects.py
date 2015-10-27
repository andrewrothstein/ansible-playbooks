#!/usr/bin/env python

import os
from subprocess import call

ansible_playbooks_roles_dir = "/Users/drew/git/github/andrewrothstein/ansible-playbooks/roles"
github_repos_dir = "/Users/drew/git/github-target"
license_path = "/Users/drew/git/github/andrewrothstein/ansible-julia/LICENSE"
readme_path = "/Users/drew/git/github/andrewrothstein/ansible-julia/README.md"

d

def create_git_repo(role) :
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

skip = set(['julia', 'proxify'])

roles = filter(lambda x : os.path.isdir(x) and x not in skip, os.listdir(ansible_playbooks_roles_dir))
map(create_git_repo, roles)
