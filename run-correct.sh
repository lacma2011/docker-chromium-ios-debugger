
docker run -it --rm -u docker --net host -e DISPLAY=unix$DISPLAY --privileged -v "$HOME/.Xauthority:/root/.Xauthority:rw" -v '/dev/bus/usb:/dev/bus/usb' chromium_ubuntu /usr/bin/chromium-browser
