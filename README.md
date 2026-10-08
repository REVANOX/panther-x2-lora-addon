# Panther X2 LoRa add-on

Home Assistant add-on for the MerryIoT Panther X2 (RK3566). Runs the SX1302 packet forwarder on /dev/spidev3.0 (SX1257 radios, EU868, clksrc 1) and resets the concentrator over GPIO120/GPIO129.

Needs /dev/spidev3.0, which requires SPI3 to be enabled in the device tree of the HAOS image.

Install: Settings > Add-ons > Add-on Store > three dots > Repositories > add https://github.com/REVANOX/panther-x2-lora-addon
