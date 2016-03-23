/etc/hosts:
    file.managed:
    - name: /etc/hosts
    - source: salt://hosts/hosts
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - context:
        ip: {{ salt['network.interfaces']()['eth0']['inet'][0]['address'] }}
        nodename: {{ salt['network.get_hostname']() }}
