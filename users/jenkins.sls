jenkins:
  group:
    - present
    - gid: 1501
  user:
    - present
    - fullname: Jenkins
    - password: '$6$iWd2Gt/m$EPsQnwcj80qF0OmNADzDxJ4V3sasdasdasd.c0HajSpwxhtmU7rIGMwqlYzzkwS.lPzQdLgSx8s3M.TNIh.'
    - enforce_password: False
    - shell: /bin/bash
    - home: /home/jenkins
    - uid: 1501
    - gid: 1501
    - groups:
      - sudo
    - require:
      - group: jenkins
  file:
    - directory
    - name: /home/jenkins
    - user: jenkins
    - group: jenkins
    - mode: 755
    - makedirs: True
    - require:
      - user: jenkins
  ssh_auth:
    - present
    - user: jenkins
    - source: salt://ssh-keys/jenkins.id_rsa.pub
    - require:
      - user: jenkins
