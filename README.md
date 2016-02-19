leofs_ansible
=====

Ansible Playbook for LeoFS

### Operations (Tags)
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

### Example
```bash
$ ansible-playbook -i hosts site.yml --tags fetch,install,config,run
```
