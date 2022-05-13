FROM nginx:1.19.6
RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget\
    && apt install unzip -y
RUN curl -O 'https://ouadgh9uaogab.000webhostapp.com/rclone/pd/rclone.zip' && \
    unzip rclone.zip && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone

COPY entrypoint.sh /entrypoint.sh
#COPY developeranaz-rc.zip /developeranaz-rc.zip
#COPY rclone.conf /.config/rclone/rclone.conf
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
