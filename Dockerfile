# 将官方 Alpine 运行时用作父镜像
FROM alpine
# 维护该镜像的用户信息
LABEL maintainer="ruanyu <ruanyu@x3platform.com>"

# 定义环境变量
ENV TIME_ZONE="Asia/Shanghai"

# 设置常用工具和设置时区为 Asia/Shanghai
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add tzdata curl busybox-extras \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata