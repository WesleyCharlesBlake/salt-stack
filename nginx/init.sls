nginx:
  pkg:
    - installed
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/nginx.conf
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: nginx
  service.running:
    - enable: True
    - watch:
      - file: /etc/nginx/nginx.conf
      - pkg: nginx
