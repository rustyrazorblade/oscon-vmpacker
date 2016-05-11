cat <<EOF > /etc/apt/sources.list.d/cassandra.list
deb http://www.apache.org/dist/cassandra/debian 30x main
deb-src http://www.apache.org/dist/cassandra/debian 30x main
EOF

apt-get update

cat > /usr/sbin/policy-rc.d <<EOF
#!/bin/sh
echo "All runlevel operations denied by policy" >&2
exit 101
EOF

chmod +x /usr/sbin/policy-rc.d

apt-get install -y cassandra

rm -f /etc/cassandra/cassandra.yaml
rm -f /etc/cassandra/jvm.options

cp /tmp/cassandra.yaml /etc/cassandra/cassandra.yaml
cp /tmp/jvm.options /etc/cassandra/jvm.options

service cassandra start
