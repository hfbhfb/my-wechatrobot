FROM busybox:uclibc
COPY wechatrobot /
WORKDIR /
CMD ["/wechatrobot","--RobotKey=b69dc161-0025-4ddf-b73a-cdc04b876735"]
