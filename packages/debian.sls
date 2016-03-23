debian:
  pkg.installed:
    - names:
      - rsync
      - lsof
      - dstat
      - wget
      - traceroute
      - iputils-tracepath
      - bash
      - ethtool
      - pciutils
      - vim
      - python-pip
      - htop
      - curl

/bin/sh:
  file.symlink:
    - target: /bin/bash
    - force: True
