base:
    '*':
        - ntp
        - sudo
        - hosts
        - users
        - users.wesley
        - users.jenkins
        - salt.minion
        - munin-node

    'os:Debian':
        - match: grain
        - packages.debian
        - packages.app-servers
        - packages.django-webserver

    'salt.yoursaltmaster.com':
        - match: pcre
        - salt.master

    'web-*.yourdomain.com':
        - match: pcre
        - nginx

    'app-*.yourdomain.com':
        - match: pcre
        - packages.app-servers
        - nodejs
        - postfix

    'db-*.yourdomain.com':
        - match: pcre
        - postgres


