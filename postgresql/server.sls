postgresql-9.5:
  pkg:
    - installed
  file.managed:
    - name: /etc/postgresql/9.5/main/postgresql.conf
    - source: salt://postgresql/postgresql.conf
    - user: postgres
    - group: postgres
    - mode: 0644
    - require:
      - pkg: postgresql-9.5

postgresql:
  service.running:
    - enable: True
    - watch:
      - file: /etc/postgresql/9.5/main/postgresql.conf
      - pkg: postgresql-9.5
