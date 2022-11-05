FROM busybox:uclibc
COPY /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY wechatrobot /
WORKDIR /
CMD ["/wechatrobot","--RobotKey=b69dc161-0025-4ddf-b73a-cdc04b876735"]
