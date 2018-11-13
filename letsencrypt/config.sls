# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "letsencrypt/map.jinja" import letsencrypt with context %}

letsencrypt-config-directory:
  file.directory:
    - name: {{ letsencrypt.config_dir.path }}
    - user: {{ letsencrypt.config_dir.user }}
    - group: {{ letsencrypt.config_dir.group }}
    - dir_mode: {{ letsencrypt.config_dir.mode }}

letsencrypt-config:
  file.managed:
    - name: {{ letsencrypt.config_dir.path }}/cli.ini
    - user: {{ letsencrypt.config_dir.user }}
    - group: {{ letsencrypt.config_dir.group }}
    - source: salt://letsencrypt/files/cli.ini.jinja
    - template: jinja
    - makedirs: true
    - context:
      config: {{ salt['pillar.get']('letsencrypt:config') }}
