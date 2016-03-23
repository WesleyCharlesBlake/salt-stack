munin-node:
  pkg:
    - installed
  file.managed:
    - name: /etc/munin/munin-node.conf
    - source: salt://munin-node/munin-node.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: munin-node
    - context:
        ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}
  service.running:
    - enable: True
    - watch:
      - file: /etc/munin/munin-node.conf
      - pkg: munin-node