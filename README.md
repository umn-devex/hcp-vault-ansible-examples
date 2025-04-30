# hcp-vault-ansible-examples

This repository contains example ansible roles and playbooks for interacting with Vault.

## Roles

- [vault_proxy](./roles/vault_proxy/README.md) - Role to deploy vault proxy to RHEL9 VM as systemd service.

## Playbooks

- [deploy_vault_proxy](./deploy_vault_proxy.yml) - Playbook to call the [vault_proxy](./roles/vault_proxy/README.md) role.

- [vault-credential-lookup](./vault-credential-lookup.yml) - Playbook to retrieve secrets with the `community.hashi_vault` module. See [this page](https://docs.secm.oit.umn.edu/Integration%20Examples/Ansible/awx_aap/#ansible-community-collection) for more information.

- [vault-credential-secret-plugin](./vault-credential-secret-plugin.yml) - Playbook to display `single_secret` from AWX/AAP credential. See [this page](https://docs.secm.oit.umn.edu/Integration%20Examples/Ansible/awx_aap/#awx-aap-credential) for more information 
