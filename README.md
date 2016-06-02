leofs_ansible
=====

Ansible Playbook for LeoFS

## Dependencies
Ansible 2.0+

## Description
This playbook aims to provide a easy way to deploy LeoFS Cluster including LeoManager, LeoStorage, LeoGateway

It would automatically fetch package from GitHub and install
- Check [leofs/releases](https://github.com/leo-project/leofs/releases) for availables versions

Alternatively, you can supply a custom build script

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

2. Choose Install Method
    ```yaml
    [all:vars]
    leofs_version=1.2.22
    build_temp_path="/tmp/leofs_builder"
    build_install_path="/tmp/"
    source="package" | "build"
    ```

3. Run Ansible-Playbook
    ```bash
    ## Build LeoFS
    $ ansible-playbook -i hosts build_leofs.yml

    ## Install LeoFS
    $ ansible-playbook -i hosts install_leofs.yml

    ## Config LeoFS
    $ ansible-playbook -i hosts config_leofs.yml

    ## Start LeoFS
    $ ansible-playbook -i hosts start_leofs.yml

    ## Stop LeoFS
    $ ansible-playbook -i hosts stop_leofs.yml

    ## Purge LeoFS
    $ ansible-playbook -i hosts purge_leofs.yml
    ```

You may need to use the `-b` option to escalate your permission when install with package

## Configurations
### Important Configurations
**LeoManagers**
```yaml
leo_manager_0_nodename: M0@host1
leo_manager_1_nodename: M1@host1
```
These are crucial information for LeoFS, the example [group_vars/all](group_vars/all) would automatically generate based on Ansible inventory `[leo_manager_0]` and `[leo_manager_1]`

If you do not include LeoManagers in inventory, you need to explicitly set the variables

### Configurable Parameters
Please check the `defaults/main.yml` for configurable parameters and explainations at `templates/*.conf` in each role

## Roles
- builder
  * Builder for LeoFS
- controller (localhost)
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
