#!/bin/bash

# ||||||  |||||
# ||     ||
# ||||||  |||||
# ||          ||
# ||      |||||          

# This script is to list the available sinks from pulse and then identifying which index the usb audio is on.
# Then the index number is stored as the sink variable
# This is in combination with a udev rule that will run this script when usb audio is detected for my Dell XPS 13
# Disclaimer:  This script may not work for all devices.

#tmpout=/tmp/pulseusbsink.tmp
#sink=$(cat /tmp/pulseusbsink.tmp)

#pacmd list-sinks | grep -e 'name:' -e 'index' | awk '{print $2}' | cut -c 1 | wc -l > ${tmpout}

#pacmd set-default-sink ${sink}

pacmd set-default-sink alsa_output.usb-Generic_USB_Audio_200901010001-00.analog-stereo

