FROM ubuntu:latest

RUN useradd -ms /bin/bash docker
RUN usermod -aG sudo docker
RUN echo '%sudo ALL=NOPASSWD: ALL' > /etc/sudoers
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y chromium-browser browser-plugin-freshplayer-libpdf browser-plugin-freshplayer-pepperflash chromium-codecs-ffmpeg-extra
USER docker
WORKDIR /home/docker



# usb utilities like lsusb
RUN apt install -y usbutils


# for ios-webkit-debug-proxy
USER root
RUN apt-get install autoconf automake libusb-dev libusb-1.0-0-dev libplist-dev libplist++-dev usbmuxd libtool libimobiledevice-dev -y
RUN apt-get install -y git
RUN mkdir /tmp/ios && \
    git clone https://github.com/google/ios-webkit-debug-proxy.git /tmp/ios && \
    cd /tmp/ios && \
    ./autogen.sh && \
    make && \
    make install


# for https://github.com/libimobiledevice/libimobiledevice
RUN apt-get install -y libssl-dev libplist-dev libusbmuxd-dev
RUN apt-get install -y usbmuxd make automake autoconf libtool pkg-config gcc python-dev
RUN mkdir /tmp/libimobile && \
    git clone https://github.com/libimobiledevice/libimobiledevice.git /tmp/libimobile && \
    cd /tmp/libimobile && \
    git reset --hard fb71aeef10488ed7b0e60a1c8a553193301428c0 && \
    ./autogen.sh && \
    make && \
    make install
# for git commit hard: https://github.com/libimobiledevice/libimobiledevice/issues/709


# do theses steps for this tool?
# https://github.com/RemoteDebug/remotedebug-ios-webkit-adapter

# starting ios_webkit_debug_proxy:
# start usbmuxd:
#    usbmuxd
# get apple device ID:
#    lsusb -s :`lsusb | grep iPhone | cut -d ' ' -f 4 | sed 's/://'` -v | grep iSerial | awk '{print $3}'
# from that number do this
#    ios_webkit_debug_proxy -u ce22f6fa08cc019279c9060b9c5c557637bd6038 -f chrome-devtools://devtools/bundled/inspector.html
