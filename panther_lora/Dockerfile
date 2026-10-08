ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apt-get update \
 && apt-get install -y --no-install-recommends git build-essential ca-certificates gpiod jq \
 && git clone --depth 1 https://github.com/onicolaos/pantherx2_sx1302_hal.git /opt/sx1302 \
 && make -C /opt/sx1302 -j2 \
 && cd /opt/sx1302/packet_forwarder \
 && cp global_conf.json.sx1257.EU868 global_conf.json \
 && sed -i 's#/dev/spidev0.0#/dev/spidev3.0#; s/"clksrc": *0/"clksrc": 1/' global_conf.json \
 && rm -rf /var/lib/apt/lists/*

COPY reset_lgw.sh run.sh /opt/sx1302/packet_forwarder/
RUN chmod +x /opt/sx1302/packet_forwarder/reset_lgw.sh /opt/sx1302/packet_forwarder/run.sh

CMD ["/opt/sx1302/packet_forwarder/run.sh"]
