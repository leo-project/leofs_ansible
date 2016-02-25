leofs_ansible
=====

Ansible Playbook for LeoFS

## Dependencies
Ansible 2.0+

## Description
This playbook aims to provide a easy way to deploy LeoFS Cluster including LeoManager, LeoStorage, LeoGateway
It would automatically fetch package from GitHub and install
- Check [roles/common/vars/leofs_releases](roles/common/vars/leofs_releases) for available versions

## How to use
1. Setup Inventory (Reference to [hosts.sample](hosts.sample)
```yaml
[leo_manager_0]
host_for_manager_0

[leo_manager_1]
host_for_manager_1

[leo_storage]
host_for_storages

[leo_gateway]
host_for_gateway
```

2. Run Ansible-Playbook
```bash
## Install and start LeoFS
$ ansible-playbook -i hosts site.yml --tags fetch,install,config,run

## Stop LeoFS
$ ansible-playbook -i hosts site.yml --tags stop

## Uninstall LeoFS
$ ansible-playbook -i hosts site.yml --tags uninstall
```

## Configurations
### Important Configurations
**LeoManagers**
```yaml
leo_manager_0_nodename: M0@host1
leo_manager_1_nodename: M1@host1
```
This is the crucial information for LeoFS, the example [group_vars/all](group_vars/all) would automatically generate based on Ansible inventory `[leo_manager_0]` and `[leo_manager_1]`

If you do not include LeoManagers in inventory, you need to explicitly set the variables

### Configurable Parameters
Please check the `defaults/main.yml` for configurable parameters and explainations at `templates/*.conf` in each role

## Operations (Tags)
- fetch
  * Fetch LeoFS Package (Check `roles/common/vars/leofs_releases`)
- install
  * Install LeoFS
- uninstall
  * Uninstall LeoFS
- purge
  * Purge LeoFS
- run
  * Run LeoFS

## Roles
- controller (localhost)
  * Fetch LeoFS Packages
  * LeoFS Admin Operations (start/stop/...)
- common
  * Common Tasks such as installation, uninstallation, ...
  * Common Configurations such as log level, log/temp directories, ...
- leo_manager_0
  * `LeoManager` (Primary)
- leo_manager_1
  * `LeoManager` (Secondary)
- leo_storage
  * `LeoStorage` Storage Node of LeoFS
- leo_gateway
  * `LeoGateway` Gateway to access LeoFS

## Sponsors
LeoProject/LeoFS is sponsored by [Rakuten, Inc.](http://global.rakuten.com/corp/) and supported by [Rakuten Institute of Technology](http://rit.rakuten.co.jp/).
