#!/bin/sh

# Setup FRP
wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir /frps \
    && cp frp_${FRP_VERSION}_linux_amd64/frps* /frps/ \
    && rm -rf frp_${FRP_VERSION}_linux_amd64*

# Clean APK cache
rm -rf /var/cache/apk/*

# Dynamic set frps.ini based on PORT
cd /frps
cat <<-EOF > /frps/frps.ini
[common]
bind_port = $PORT
EOF

/frps/frps -c /frps/frps.ini
