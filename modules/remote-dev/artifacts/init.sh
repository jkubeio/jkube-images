#!/bin/sh

set -e

if [ -z "$PUBLIC_KEY" ]; then
  echo "PUBLIC_KEY is required"
  exit 1
fi

echo "$PUBLIC_KEY" >> /opt/ssh-config/authorized_keys

echo "Current container user is: $(whoami)"

ssh-keygen -A

/usr/sbin/sshd.pam -D -e -p 2222

