#!/usr/bin/env bash
private="-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAqh5UHkl+3sGQpXplITg8XHnn0fLzQb4ibEl3jB4deS5SLwPN
K20pEXl8+KMxqoLdb7gUK9nM5pzPjenjaeGxkzyrRFwksVbn5/tM2HdZjA7GP6yg
DhUAxkkvKJyvgSkJ49bJh4OI80bKtUEGwNTn0u9SreM3lj6JPJslSuqQrZ+wlTYo
uRTYcdmyHNx1HBkfB6KFCL1qvTbBIvlY5yHPMhcaR6hXxvjvUc58XF75uEChzQ7q
gP4v4CY3sM4SgoPyHFNhh/splaL7gl7XTcQ1+4RZepnUBp9KiHIcXTS1AS4H5evI
/ZN+wjWoKKvwX0u3A+Ced4UqhsI7kFrjB7Rc2QIDAQABAoIBAQCFroeTtVWJXrp4
DxJhZHuqf/F3vl8CDpOmXKUg6plmnMvgPjCAK6vWG43lJPjmcSfpntHbE7A8mIVR
k7Ytgjm05jv/4BjFcvGSDpx4jnFD6mhHqTOtXTvalbAFTftsl/85l5OOdgKsibjJ
bmwMJEJ4M7DZDHCmFEZr5c8Ma/99L3PWTnNRM6H/v2JyXGh/QdgZp7ndvbJ7gDOr
UdCZFmpVYAfzNgV1kr2szAbEy5HJTwU1Hcf9/7LG0OxbwFZF2wTep/QoRMCot4yt
cMgTqWUBzupVxbp7nKIgci0/7mXdRCZOyJMpeRXRID6B5nGJLqXA8kFwi6g/z5qT
9L+ntYgxAoGBANV+fiWZS9X7nlNHh4Qlna0/CXmMLqwfiZR8++xwUiDJRgpYIXCM
nLRa+y5JSnm7BNPSGO1iyGTeMOt/T7AZvEg9V4H4L+dVHpZ2N5v7CvxqRMdIDwIR
zCKZbT3UXssRivYUcnGu+Kc5NsSJo0QvBwy+AqmsTiPUsfntEryR02fbAoGBAMv9
Ca9+8+wTe81MHxo5BUexVcLxu7M3e1m6Bm5rC42pkMCfyMs20eyqTiW6Eeb7OKue
9wl8lCf9gXr50QKZhyDJL/5rdloGfv/V52DXUbpbUx2oJx9+zQDbc8BH/01lHllx
pB7jLFAoRagFDSYyDowr2/7ro7SUUYq7UwdH5vZbAoGBAJlTdg9UsAUm50cSGP5L
8ZjJq+lSRvaw06MDu/3LkQAg7R9iuelV4vkYWkqcslMIgGgL/IEIL7lZZbLLxRRI
91K+U0lxUB4IoKYYksmAGxy6yViBpN2soHm8zJraGZYnrDAc8TA6JDQcv/uYidvf
FmYNVGY87AWJrKQ8ofcxl61/AoGBALpvyHxncZSgshQOsJaM6vB9eb60pTLFUK3P
QbWFjIerJKuI3kItFmxRsx70EwyjK0ZgAbTf8aEjJ0Y4MPlJTKGAf6bunLrnGQfG
frSZ1w6WDT8bwrYcdE2GRSLGKuaXtsdVAAVi58tTI2bPRxdTxMwEAgvZXkPbEzPS
xa3v333lAoGAF4x6HVcqmP1QFQ1IkuhzfNwaM/BH1c1cTvKYwmcWt07pZW9sDgnx
gPPiZ5k5gGYPZvbIUeFULRko6DiD3u8BUyYjQeLXlDm0N+SuHpycmgs5f/m0D+Rz
iDYRUDEFSyYzRTRs8UNZACIwJGR9g8XTFVZBNmNi7oThzR0K+C+OfNY=
-----END RSA PRIVATE KEY-----"
public="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqHlQeSX7ewZClemUhODxceefR8vNBviJsSXeMHh15LlIvA80rbSkReXz4ozGqgt1vuBQr2czmnM+N6eNp4bGTPKtEXCSxVufn+0zYd1mMDsY/rKAOFQDGSS8onK+BKQnj1smHg4jzRsq1QQbA1OfS71Kt4zeWPok8myVK6pCtn7CVNii5FNhx2bIc3HUcGR8HooUIvWq9NsEi+VjnIc8yFxpHqFfG+O9RznxcXvm4QKHNDuqA/i/gJjewzhKCg/IcU2GH+ymVovuCXtdNxDX7hFl6mdQGn0qIchxdNLUBLgfl68j9k37CNagoq/BfS7cD4J53hSqGwjuQWuMHtFzZ ansible"
hosts="192.168.56.51\tmaster-01\n192.168.56.101\tnode-01\n192.168.56.102\tnode-02\n192.168.56.103\tnode-03\n"
ssh_conf="Host node-*\n\tIdentityFile ~/.ssh/ansible.id_rsa\n\tStrictHostKeyChecking=no\n\tUserKnownHostsFile=/dev/null\n"
dir="/home/vagrant/.ssh"

mkdir -p "$dir"
echo "$private"      >  "$dir/ansible.id_rsa"
echo "$public"       >  "$dir/ansible.id_rsa.pub"
echo -ne "$ssh_conf" >> "$dir/config"
chmod 600 "$dir/ansible.id_rsa"
chmod 644 "$dir/ansible.id_rsa.pub"
chown -R vagrant: "$dir"

echo "$public"         >> "$dir/authorized_keys"
sed -i "/$(hostname)/d" /etc/hosts

yum install -y wget
wget https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-x86_64 -O /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


sed -ie 's/^#MaxAuthTries.*/MaxAuthTries 100/g' /etc/ssh/sshd_config
systemctl restart sshd

