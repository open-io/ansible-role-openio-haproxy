[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-haproxy.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-haproxy)
# Ansible role `haproxy`

An Ansible role for PURPOSE. Specifically, the responsibilities of this role are to:

- Install HAPROXY
- Setup frontend and backend for OPENIO SDS

## Requirements

- Ansible 2.4+

## Role Variables


| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `haproxy_certbot_frontend` | `false` | ... |
| `haproxy_conf_path` | `/etc/haproxy/haproxy.cfg` | ... |
| `haproxy_conf_template` | `haproxy.cfg.j2` | ... |
| `haproxy_conscience_backend_url` | `` | ... |
| `haproxy_conscience_frontend` | `false` | ... |
| `haproxy_conscience_frontend_bind` | `172.17.0.2` | ... |
| `haproxy_default_mode` | `http` | ... |
| `haproxy_default_options` | `` | ... |
| `haproxy_defaults_errorfiles` | `` | ... |
| `haproxy_defaults_log` | `global` | ... |
| `haproxy_defaults_timeouts` | `` | ... |
| `haproxy_defaults_unique_id_format` | `'%{+X}o\ %ci` | ... |
| `haproxy_defaults_unique_id_header` | `'X-Unique-ID'` | ... |
| `haproxy_global_ca_base` | `/etc/ssl/certs` | ... |
| `haproxy_global_chroot` | `/var/lib/haproxy` | ... |
| `haproxy_global_crt_base` | `/etc/ssl/private` | ... |
| `haproxy_global_group` | `haproxy` | ... |
| `haproxy_global_log_facility` | `local5` | ... |
| `haproxy_global_log_level` | `debug` | ... |
| `haproxy_global_log_socket` | `127.0.0.1` | ... |
| `haproxy_global_ssl_default_bind_ciphers` | `ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS` | ... |
| `haproxy_global_ssl_default_bind_options` | `no-sslv3 no-tlsv10 no-tls-tickets` | ... |
| `haproxy_global_ssl_default_server_ciphers` | `CDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS` | ... |
| `haproxy_global_ssl_default_server_options` | `no-sslv3 no-tlsv10 no-tls-tickets` | ... |
| `haproxy_global_ssl_dh_param_file` | `/etc/certbot/dhparams.pem` | ... |
| `haproxy_global_stats_socket` | `/run/haproxy/haproxy.sock mode 0660 level admin` | ... |
| `haproxy_global_stats_timeout` | `30s` | ... |
| `haproxy_global_tune_ssl_default_dh_param` | `2048` | ... |
| `haproxy_global_user` | `haproxy` | ... |
| `haproxy_keystone_admin_backend_url` | `` | ... |
| `haproxy_keystone_admin_frontend_bind` | `172.17.0.2:35357` | ... |
| `haproxy_keystone_frontend` | `false` | ... |
| `haproxy_keystone_internal_backend_url` | `` | ... |
| `haproxy_keystone_internal_frontend_bind` | `172.17.0.2` | ... |
| `haproxy_keystone_public_backend_url` | `` | ... |
| `haproxy_keystone_public_frontend_bind` | `0.0.0.0` | ... |
| `haproxy_logrotate_conf_template` | `logrotate_haproxy.conf.j2` | ... |
| `haproxy_logrotate_managed` | `true` | ... |
| `haproxy_logrotate_retention` | `5` | ... |
| `haproxy_logrotate_template_conf_path` | `/etc/logrotate.d/haproxy` | ... |
| `haproxy_logs_directory` | `/var/log/haproxy` | ... |
| `haproxy_logs_facility` | `5` | ... |
| `haproxy_rsyslog_conf_path` | `/etc/rsyslog.d/49-haproxy.conf` | ... |
| `haproxy_rsyslog_conf_template` | `rsyslog_haproxy.conf.j2` | ... |
| `haproxy_rsyslog_managed` | `true` | ... |
| `haproxy_stats_address` | `127.0.0.1` | ... |
| `haproxy_stats_login` | `admin` | ... |
| `haproxy_stats_password` | `HA_PASS` | ... |
| `haproxy_stats_path` | `/stats` | ... |
| `haproxy_stats_port` | `9000` | ... |
| `haproxy_swift_backend_url` | `` | ... |
| `haproxy_swift_frontend` | `false` | ... |
| `haproxy_swift_private_frontend_bind` | `172.17.0.2` | ... |
| `haproxy_swift_public_frontend_bind` | `0.0.0.0:80` | ... |
| `haproxy_sysctl_entries` | `` | ... |
| `haproxy_sysctl_managed` | `true` | ... |
| `haproxy_sysctl_template_dest` | `/etc/sysctl.d/49-haproxy.conf` | ... |
## Dependencies

No dependencies.

## Example Playbook

```yaml
- hosts: all
  gather_facts: true
  become: true
  vars:
    service_ip: '192.168.4.200'

  roles:
    - role: haproxy
      haproxy_sysctl_managed: true
      haproxy_swift_frontend: true
      haproxy_swift_private_frontend_bind:  "{{ service_ip }}:6007"
      haproxy_swift_public_frontend_bind: "{{ service_ip }}:6007"
      haproxy_swift_backend_url: ['192.168.4.205:6007','192.168.4.206:6007','192.168.4.207:6007']
      haproxy_keystone_frontend: true
      haproxy_keystone_admin_frontend_bind: "{{ service_ip }}:35357"
      haproxy_keystone_admin_backend_url: ['192.168.4.205:35357','192.168.4.206:35357','192.168.4.207:35357']
      haproxy_keystone_internal_frontend_bind: "{{ service_ip }}:5000"
      haproxy_keystone_internal_backend_url: ['192.168.4.205:5000','192.168.4.206:5000','192.168.4.207:5000']
      haproxy_keystone_public_frontend_bind: "{{ service_ip }}:5000"
      haproxy_keystone_public_backend_url: ['192.168.4.205:5000','192.168.4.206:5000','192.168.4.207:5000']
      haproxy_conscience_frontend: true
      haproxy_conscience_frontend_bind: "{{ service_ip }}:6000"
      haproxy_conscience_backend_url: ['192.168.4.205:6000','192.168.4.207:6000']
```


```ini
[all]
node1 ansible_host=192.168.1.173
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License

Apache License, Version 2.0

## Contributors

- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
- [Romain ACCIARI](https://github.com/racciari) (maintainer)
- [Vincent LEGOLL](https://github.com/vincent-legoll) (maintainer)
- [Sebastien LAPIERRE](https://github.com/sebastienlapierre) (maintainer)
- [Geoffrey TIEN](https://github.com/GeoffreyTien) (maintainer)
