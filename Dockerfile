FROM busybox:uclibc
COPY wechatrobot /bin/
WORKDIR /
CMD ["./wechatrobot","--RobotKey=899220cd-5ed6-44ad-b053-f3785033da7f"]
