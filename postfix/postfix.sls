postfix:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - pkg: postfix
