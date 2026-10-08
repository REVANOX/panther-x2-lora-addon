#!/bin/bash
cd /opt/sx1302/packet_forwarder || exit 1
OPT=/data/options.json
SRV=$(jq -r .server_address "$OPT")
PORT=$(jq -r .server_port "$OPT")
GWID=$(jq -r .gateway_id "$OPT")
sed -i "s/\"server_address\": *\"[^\"]*\"/\"server_address\": \"$SRV\"/; s/\"serv_port_up\": *[0-9]*/\"serv_port_up\": $PORT/; s/\"serv_port_down\": *[0-9]*/\"serv_port_down\": $PORT/; s/\"gateway_ID\": *\"[^\"]*\"/\"gateway_ID\": \"$GWID\"/" global_conf.json
echo "Starting lora_pkt_fwd -> $SRV:$PORT as gateway $GWID"
exec ./lora_pkt_fwd -c global_conf.json
