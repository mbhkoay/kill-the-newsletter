#!/bin/bash

set -euxo pipefail

ssh-add

ssh -tA root@kill-the-newsletter.com 'systemctl stop server caddy exim'

ssh -tA kill-the-newsletter@kill-the-newsletter.com 'cd www.kill-the-newsletter.com && git pull origin master'

ssh -tA kill-the-newsletter@kill-the-newsletter.com 'cd www.kill-the-newsletter.com && bash -ic "bundle install"'

ssh -tA root@kill-the-newsletter.com 'rsync -av --chown root:root ~kill-the-newsletter/www.kill-the-newsletter.com/exim.conf /home/linuxbrew/.linuxbrew/etc/exim.conf'

ssh -tA root@kill-the-newsletter.com 'rsync -av --chown root:root ~kill-the-newsletter/www.kill-the-newsletter.com/server.service /etc/systemd/system/server.service'
ssh -tA root@kill-the-newsletter.com 'rsync -av --chown root:root ~kill-the-newsletter/www.kill-the-newsletter.com/caddy.service /etc/systemd/system/caddy.service'
ssh -tA root@kill-the-newsletter.com 'rsync -av --chown root:root ~kill-the-newsletter/www.kill-the-newsletter.com/exim.service /etc/systemd/system/exim.service'

ssh -tA root@kill-the-newsletter.com 'systemctl daemon-reload'
ssh -tA root@kill-the-newsletter.com 'systemctl start server caddy exim'
ssh -tA root@kill-the-newsletter.com 'systemctl enable server caddy exim'