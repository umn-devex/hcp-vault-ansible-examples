# vault_proxy

The vault_proxy ansible role is designed to deploy and bootstrap a vault proxy as a systemd service with self renewing secret-id's on a RHEL9 VM. The service will be able to restart by using it's existing sink token as long as it is not down for more than 1hr (or the ttl of the proxy approle). To re-bootstrap a VM with an expired sink token, simply re-run the role.

## Vars 

vault_proxy_vault_addr & vault_proxy_vault_namespace vars need to be configured in roles/vault_proxy/vars/main.yml

## Vault Policies

This ansible role requires the vault user or approle running this playbook to have the following permissions:

```console
path "auth/approle/role/proxy/role-id" {
    capabilities = ["read"]
}

path "auth/approle/role/proxy/secret-id" {
    capabilities = ["create", "update"]
}
```

The approle used for the proxy agent needs the following permissions (along with permissions to access whatever secrets the proxy needs).

```console
path "sys/events/subscribe/kv*" {
   capabilities = ["read"]
}
path "sys/leases/*" {
  capabilities = ["create", "update"]
}
path "auth/token/*" {
  capabilities = ["create", "update"]
}
path "auth/approle/role/proxy/secret-id" {
  capabilities = ["create", "update"]
}
```

## Docs

For more information on the vault proxy, see https://docs.secm.oit.umn.edu/Integration%20Examples/Vault%20Agent%20and%20Proxy/vault_proxy/
