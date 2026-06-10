FROM alpine:latest

RUN apk update && \
    apk add --no-cache openssh shadow && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /run/sshd

# إنشاء مفاتيح SSH (مهم في ألباين)
RUN ssh-keygen -A

RUN echo "root:lookmora" | chpasswd

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
