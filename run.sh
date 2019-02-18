docker run -it --rm --net host -e DISPLAY=unix$DISPLAY --privileged --volume="$HOME/.Xauthority:/root/.Xauthority:rw" 0c5f58b7a709 /usr/bin/chromium-browser
