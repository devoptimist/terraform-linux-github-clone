#!/bin/bash
cd ~/
%{ if git_key != "" }
cat << EOF >> /tmp/git_tmp_key
${ git_key }
EOF
if [[ ! -d ~/.ssh/ ]]; then
  mkdir  ~/.ssh
  chmod 700 ~/.ssh
fi
cat << EOF >> ~/.ssh/config
Host github.com
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
   IdentityFile = /tmp/git_tmp_key
   HostName github.com
   User git
EOF
%{ endif }

%{ if git_repo != "" }
git clone ${git_repo} 
%{ endif }

%{ if git_key != "" }
rm -rf /tmp/git_tmp_key
rm -rf ~/.ssh/config
%{ endif }
