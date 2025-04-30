vault {
}

pid_file = "/etc/vault.d/pid/vault-proxy-pid"

auto_auth {
   method {
      type = "approle"
      config = {
         role_id_file_path = "/etc/vault.d/roleID"
         secret_id_file_path = "/etc/vault.d/secretID"
      }
   }
   sink "file" {
      config = {
            path = "/etc/vault.d/vault-token-via-agent"
      }
   }
}

// Address in which the proxy will listen on
listener "tcp" {
   address     = "127.0.0.1:8200"
   tls_disable = true
}

api_proxy {
   // if use_auto_auth_token is enabled, auto_auth stanza must be configured
   use_auto_auth_token = true
   enforce_consistency = "always"
}

cache {
   // Requires Vault Enterprise 1.16 or later
   cache_static_secrets = true
   static_secret_token_capability_refresh_interval = "5m" //Determines how often Proxy needs to verify and update cached tokens and secrets
}
