ntp:
  pkg:
    - installed
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/ntp.conf
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: ntp
  service.running:
    - enable: True
    - watch:
      - file: /etc/ntp.conf
      - pkg: ntp
