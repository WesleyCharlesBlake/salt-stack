salt-minion:
  pkg:
    - installed
  pip:
    - installed
    - name: raven
  file.managed:
    - name: /etc/salt/minion
    - source: salt://salt/minion
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: salt-minion
  service.running:
    - enable: True
    - watch:
      - file: /etc/salt/minion
      - pkg: salt-minion
  cron:
    - absent
    - identifier: salt-minion-highstate
    - name: /usr/bin/salt-call -l quiet state.highstate 2>&1 > /dev/null
    - user: root
    - minute: '*/30'
