[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-haproxy.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-haproxy)
# Ansible role `haproxy`

An Ansible role for configure HAproxy for openio SDS. Specifically, the responsibilities of this role are to:

- Install HAPROXY
- Setup frontend and backend for OPENIO SDS
- Backward compatibility with old role haproxy

## Requirements

- Ansible 2.4+

## Role Variables

| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `haproxy_backend_instances` | `list` | List of dict backends |
| `haproxy_certbot_backend` | `dict` | Details of backend used for certbot |
| `haproxy_certbot_frontend` | `false` | [LEGACY] Certbot {front,back}end activation |
| `haproxy_conf_path` | `/etc/haproxy/haproxy.cfg` | [LEGACY] Configuation file |
| `haproxy_conf_template` | `haproxy.cfg.j2` | [LEGACY] Name of template used for `haproxy.cfg` |
| `haproxy_conscience_backend_url` | `list` | [LEGACY] List `ip:port` of conscience  |
| `haproxy_conscience_frontend_bind` | `{{ haproxy_virtual_address }}:6000` | [LEGACY] `ip:port` of conscience virtual address |
| `haproxy_default_mode` | `http` | [LEGACY] Default mode |
| `haproxy_default_options` | `list` | Default options |
| `haproxy_defaults_errorfiles` | `list` | [LEGACY] List `code path/to/error.http` of default errors |
| `haproxy_defaults_log` | `global` | [LEGACY] Enable per-instance logging of events and traffic. |
| `haproxy_defaults_timeouts` | `list` | [LEGACY] list of timeout |
| `haproxy_defaults_unique_id_format` | `"%{+X}o\\ %ci` | [LEGACY]A unique ID header format in the HTTP request |
| `haproxy_defaults_unique_id_header` | `"X-Unique-ID"` | [LEGACY] Add a unique ID header in the HTTP request |
| `haproxy_frontend_certbot` | `dict` | Details of frontend used for certbot |
| `haproxy_frontend_instances` | `list` | List of dict frontends |
| `haproxy_global_ca_base` | `/etc/ssl/certs` | [LEGACY] Assigns a default directory to fetch SSL CA certificates  |
| `haproxy_global_chroot` | `/var/lib/haproxy` | [LEGACY] Changes current directory to <jail dir> and performs a chroot() there before
  dropping privileges |
| `haproxy_global_crt_base` | `/etc/ssl/private` | [LEGACY] Assigns a default directory to fetch SSL certificates from when a relative
  path is used with "crtfile" directives |
| `haproxy_global_group` | `haproxy` | [LEGACY]Similar to "gid" but uses the GID of group name <group name> from /etc/group |
| `haproxy_global_log_facility` | `local5` | [LEGACY] must be one of the 24 standard syslog facilities |
| `haproxy_global_log_level` | `info` | [LEGACY] An optional level can be specified to filter outgoing messages |
| `haproxy_global_log_socket` | `127.0.0.1` | [LEGACY] An IPv4 address optionally followed by a colon and a UDP port. If no port is specified, 514 is used by default (the standard syslog port) |
| `haproxy_global_ssl_default_bind_ciphers` | `ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256` | [LEGACY] It sets the default string describing the list of cipher algorithms ("cipher suite") that are negotiated during the SSL/TLS handshake for all "bind" lines which do not explicitly define theirs |
| `haproxy_global_ssl_default_bind_options` | `"no-sslv3 no-tlsv10 no-tlsv11 no-tls-tickets"` | [LEGACY] It sets default ssl-options to force on all "bind" lines |
| `haproxy_global_ssl_default_server_ciphers` | `ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256` | [LEGACY] It sets the default string describing the list of cipher algorithms that are negotiated during the SSL/TLS handshake with the server, for all "server" lines which do not explicitly define theirs |
| `haproxy_global_ssl_default_server_options` | `no-sslv3 no-tlsv10 no-tlsv11 no-tls-tickets` | [LEGACY] It sets default ssl-options to force on all "server" lines |
| `haproxy_global_stats_socket` | `/run/haproxy/stats.sock mode 0660 level admin` | [LEGACY] Binds a UNIX socket to <path> or a TCPv4/v6 address to <address:port> |
| `haproxy_global_stats_timeout` | `30s` | [LEGACY] The default timeout on the stats socket |
| `haproxy_global_user` | `haproxy` | [LEGACY] Similar to "uid" but uses the UID of user name <user name> from /etc/passwd |
| `haproxy_keystone_admin_backend_url` | `list` | [LEGACY] List `ip:port` of keystone-admin endpoint |
| `haproxy_keystone_admin_frontend_bind` | `{{ haproxy_virtual_address }}:35357` | [LEGACY] `ip:port` of keystone-admin virtual address |
| `haproxy_keystone_admin_frontend_proto` | `http` | [LEGACY] Add a header at the end of the HTTP request `X-Forwarded-Proto` |
| `haproxy_keystone_public_backend_url` | `list` | [LEGACY] List `ip:port` of keystone-public endpoint |
| `haproxy_keystone_public_frontend_bind` | `{{ haproxy_virtual_address }}:5000` | [LEGACY] `ip:port` of keystone-public virtual address |
| `haproxy_keystone_public_frontend_proto` | `http` | [LEGACY] Add a header at the end of the HTTP request `X-Forwarded-Proto` |
| `haproxy_listen_instances` | `list` |  List of dict listens |
| `haproxy_logrotate_conf_template` | `logrotate_haproxy.conf.j2` | [LEGACY] Name of template used for logrotate  |
| `haproxy_logrotate_managed` | `true` | [LEGACY] logrotate file creation |
| `haproxy_logrotate_retention` | `5` | [LEGACY] days of log retention |
| `haproxy_logrotate_template_conf_path` | `/etc/logrotate.d/haproxy` | [LEGACY] logrotate file |
| `haproxy_logs_directory` | `/var/log/haproxy` | [LEGACY] Log directory |
| `haproxy_logs_facility` | `5` | [LEGACY] Local syslog facility |
| `haproxy_rsyslog_conf_path` | `/etc/rsyslog.d/49-haproxy.conf` | [LEGACY] rsyslog file |
| `haproxy_rsyslog_conf_template` | `rsyslog_haproxy.conf.j2` | [LEGACY] Name of template used for rsyslog |
| `haproxy_rsyslog_managed` | `true` | [LEGACY] rsyslog file creation  |
| `haproxy_rsyslog_service_name` | `rsyslog` | [LEGACY] systemd rsyslog service name |
| `haproxy_stats_address` | `127.0.0.1` | [LEGACY] bind address for `stat` instance |
| `haproxy_stats_login` | `admin` | [LEGACY] user for `stat` instance |
| `haproxy_stats_password` | `HA_PASS` | [LEGACY] password for `stat` instance |
| `haproxy_stats_path` | `/stats` | [LEGACY] Enable statistics reporting at this uri |
| `haproxy_stats_port` | `9000` | [LEGACY] Enable statistics reporting on this port |
| `haproxy_swift_backend_url` | `list` | [LEGACY] List `ip:port` of swift endpoint |
| `haproxy_swift_private_frontend_bind` | `{{ haproxy_virtual_address }}:6007` | [LEGACY] `ip:port` of swift virtual address |
| `haproxy_swift_private_frontend_proto` | `http` | [LEGACY] Add a header at the end of the HTTP request `X-Forwarded-Proto` |
| `haproxy_swift_public_frontend_bind` | `{{ haproxy_virtual_address }}:6007` | [LEGACY] `ip:port` of swift virtual address |
| `haproxy_swift_public_frontend_proto` | `http` | [LEGACY] Add a header at the end of the HTTP request `X-Forwarded-Proto` |
| `haproxy_sysctl_entries` | `list` | [LEGACY] Sysctl entries |
| `haproxy_sysctl_managed` | `true` | [LEGACY] sysctl file creation  |
| `haproxy_sysctl_template_dest` | `/etc/sysctl.d/49-haproxy.conf` | [LEGACY] sysctl file |
| `haproxy_virtual_address` | `172.17.0.100` | Virtual IP address |
| `haproxy_provision_only` | `false` | Provision only without restarting or reloading services |



## Dependencies

No dependencies.

## Example Playbook
#### Legacy mode
```yaml
- hosts: all
  gather_facts: true
  become: true
  vars:
    vip: '172.17.0.101'

  roles:
    - role: haproxy
      haproxy_swift_private_frontend_bind: "{{ vip }}:6007"
      haproxy_swift_public_frontend_bind: "{{ vip }}:6007"
      haproxy_swift_backend_url: "{{ groups['oioswift'] \
      | map('extract', hostvars, ['ansible_openio_address']) \
      | map('regex_replace', '$', ':6007') | list }}"
      haproxy_keystone_admin_frontend_bind: "{{ vip }}:35357"
      haproxy_keystone_admin_backend_url: "{{ groups['keystone'] \
      | map('extract', hostvars, ['ansible_openio_address']) \
      | map('regex_replace', '$', ':35357') \
      | list }}"
      haproxy_keystone_internal_frontend_bind: "{{ vip }}:5000"
      haproxy_keystone_internal_backend_url: "{{ groups['keystone'] \
      | map('extract', hostvars, ['ansible_openio_address']) \
      | map('regex_replace', '$', ':5000') \
      | list }}"
      haproxy_keystone_public_frontend_bind: "{{ vip }}:5000"
      haproxy_keystone_public_backend_url: "{{ groups['keystone'] \
      | map('extract', hostvars, ['ansible_openio_address']) \
      | map('regex_replace', '$', ':5000') \
      | list }}"
      haproxy_conscience_frontend_bind: "{{ vip }}:6000"
      haproxy_conscience_backend_url: "{{ groups['openio_conscience'] \
      | map('extract', hostvars, ['ansible_openio_address']) \
      | map('regex_replace', '$', ':6000') \
      | list }}"
```

#### Actual mode
Light mode
```yaml
- hosts: all
  gather_facts: true
  become: true

  roles:
    - role: haproxy
      haproxy_virtual_address: 172.17.0.101
      haproxy_certbot_frontend: true
      haproxy_swift_backend_url: "{{ groups['oioswift'] \
      | map('extract', hostvars, ['ansible_openio_address']) \
      | map('regex_replace', '$', ':6007') | list }}"
      haproxy_keystone_admin_backend_url: "{{ groups['keystone'] \
      | map('extract', hostvars, ['ansible_openio_address']) \
      | map('regex_replace', '$', ':35357') \
      | list }}"
      haproxy_keystone_internal_backend_url: "{{ groups['keystone'] \
      | map('extract', hostvars, ['ansible_openio_address']) \
      | map('regex_replace', '$', ':5000') \
      | list }}"
      haproxy_keystone_public_backend_url: "{{ groups['keystone'] \
      | map('extract', hostvars, ['ansible_openio_address']) \
      | map('regex_replace', '$', ':5000') \
      | list }}"
      haproxy_conscience_backend_url: "{{ groups['openio_conscience'] \
      | map('extract', hostvars, ['ansible_openio_address']) \
      | map('regex_replace', '$', ':6000') \
      | list }}"
```

Custom mode
```yaml
- hosts: all
  gather_facts: true
  become: true

  roles:
    - role: haproxy
      haproxy_frontend_instances:
        # my custom frontend
        - name: "my-frontend"
          mode: http
          bind:
            - "{{ haproxy_virtual_address }}:80"
            - "{{ haproxy_virtual_address }}:443 ssl \
              crt {{ haproxy_global_ca_base }}/mydomain.org.crt \
              crt {{ haproxy_global_ca_base }}/myotherdomain.org.pem"
          redirect:
            - "scheme https code 301 if { hdr(host) -m reg -i (^|^[^.]*)\.mydomain\.org } !{ ssl_fc }"
            - "prefix https://www.mydomain.org code 301 if { hdr(host) -i mydomain.org }"
            - "location /openio/sds code 301 if is_root { hdr(host) -i sds.mydomain.org }"
          acl:
            - "is_root path -i /"
            - "private path_beg -i /private"
          use_backend:
            - "backend-private if private"
          default_backend: "blocked"

      haproxy_backend_instances:
        - name: "backend-private"
          mode: http
          balance: roundrobin
          server:
            - "public1 172.17.0.2:80 check"
            - "public2 172.17.0.3:80 check"
        - name: "blocked"
          mode: http
          errorfile: "403 {{ haproxy_errors_dir }}/403.http"
          tcp-request: "content reject"

```

```ini
[all]
node1 ansible_host=192.168.1.173
```
## Certificates

Creating a .pem with the private key and entire trust chain

```
-----BEGIN RSA PRIVATE KEY----- 
(Your Private Key: mydomain.org.key) 
-----END RSA PRIVATE KEY----- 
-----BEGIN CERTIFICATE----- 
(Your Primary SSL certificate: mydomain.org.crt) 
-----END CERTIFICATE----- 
-----BEGIN CERTIFICATE----- 
(Your Intermediate certificate: intermediateCA.crt) 
-----END CERTIFICATE----- 
-----BEGIN CERTIFICATE----- 
(Your Root certificate: TrustedRoot.crt) 
-----END CERTIFICATE-----
-----BEGIN X9.42 DH PARAMETERS-----
(Your DH paramaters)
-----END X9.42 DH PARAMETERS-----
```
Generate DH params with a given length
`openssl dhparam -out dhparams.pem [bits]`

## Filter

This have a intern jinja filter `list_backends`

```
my_servers:
  - "172.17.0.2:1234"
  - "172.17.0.3:1234"
  - "172.17.0.4:1234"
```

The purpose of this filter is to easily make a list of backend server.

```
# "{{ my_servers }} | list_backends(name='swift-proxy')""
server swift-proxy1 172.17.0.2:1234
server swift-proxy2 172.17.0.3:1234
server swift-proxy3 172.17.0.4:1234

# "{{ my_servers }} | list_backends(name='swift-proxy', check='5s')""
server swift-proxy1 172.17.0.2:1234 check inter 5s
server swift-proxy2 172.17.0.3:1234 check inter 5s
server swift-proxy3 172.17.0.4:1234 check inter 5s

# "{{ my_servers }} | list_backends(name='swift-proxy', active=1')""
server swift-proxy1 172.17.0.2:1234
server swift-proxy2 172.17.0.3:1234 backup
server swift-proxy3 172.17.0.4:1234 backup
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License

GNU AFFERO GENERAL PUBLIC LICENSE, Version 3

## Contributors

- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
- [Romain ACCIARI](https://github.com/racciari) (maintainer)
- [Vincent LEGOLL](https://github.com/vincent-legoll) (maintainer)

