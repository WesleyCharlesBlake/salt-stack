salt-master:
  pkg:
    - installed
  file.managed:
    - name: /etc/salt/master
    - source: salt://salt/master
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: salt-master
  service.running:
    - enable: True
    - watch:
      - file: /etc/salt/master
      - pkg: salt-master
