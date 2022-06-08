#!/bin/sh


# Dynamic set frps.ini based on PORT
cd /frps
cat <<-EOF > /frps/frps.ini
[common]
bind_port = $PORT

dashboard_port = 7500
# dashboard's username and password are both optional
dashboard_user = admin
dashboard_pwd = admin
EOF

echo "Running FRP Server :D"
echo "Binding on the port $PORT"
/frps/frps -c /frps/frps.ini
