# Overview
This module connects via ssh and git clones a repo

## Usage

```hcl
module "git_clone" {
  source                     = "devoptimist/github-clone/linux"
  version                    = "0.0.1"
  workstation_ips            = ["192.168.0.1", "192.168.0.2", "192.168.0.3"]
  ssh_password               = "MyP@ssW0rd!"
  ssh_user                   = "myuser"
  git_repo_url               = "git@github.com:myorg/myrepo.git"
  git_key                    = "-----BEGIN RSA PRIVATE KEY-----\nhkdhsakldjaskldjsaldjsakldjsakl\n-----END RSA PRIVATE KEY-----"
```
to get the key in the right format run

```
sed ':a;N;$!ba;s/\n/\\n/g' /path/to/key
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|git_repo_url| The url to git repo you want to clone | string | | no |
|git_key| The key for a github account | string | | no |
|workstation_ips| List of ip addresses to connect to |list|[]| yes |
|ssh_password| The password for the winrm user we are using to connect | string | "" | yes |
|ssh_user| The user name for the winrm user we are using to connect | string | "" | yes |
