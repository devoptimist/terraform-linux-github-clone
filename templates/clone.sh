#!/bin/bash
cd ~/
if hash yum; then
  sudo yum install -y git
elif hash apt; then
  sudo apt-get update
  sudo apt-get install -y git
fi
%{ if git_key != "" }
cat << EOF >> /tmp/git_tmp_key
${ git_key }
EOF
chmod 600 /tmp/git_tmp_key

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
chmod 600 ~/.ssh/config
%{ endif }

%{ if git_repo != "" }
git clone ${git_repo} 
%{ endif }

%{ if git_key != "" }
rm -f /tmp/git_tmp_key
rm -f ~/.ssh/config
%{ endif }
rm -f /tmp/git_clone.sh
