wesley:
  group:
    - present
    - gid: 1503
  user:
    - present
    - fullname: Wesley Blake
    - password: '$6$iWd2Gt/m$EPsQnwcj80qF0OmNADzDxJ4V3sasdasdasd.c0HajSpwxhtmU7rIGMwqlYzzkwS.lPzQdLgSx8s3M.TNIh.'
    - enforce_password: False
    - shell: /bin/bash
    - home: /home/wesley
    - uid: 1503
    - gid: 1503
    - groups:
      - sudo
    - require:
      - group: wesley
  file:
    - directory
    - name: /home/wesley
    - user: wesley
    - group: wesley
    - mode: 755
    - makedirs: True
    - require:
      - user: wesley
  ssh_auth:
    - present
    - user: wesley
    - source: salt://ssh-keys/wesley.id_rsa.pub
    - require:
      - user: wesley