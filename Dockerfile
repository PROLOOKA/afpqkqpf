FROM alpine:3.20

RUN apk add --no-cache openssh

RUN mkdir -p /run/sshd

# تعيين كلمة المرور
RUN echo "root:lookmora" | chpasswd

# تفعيل تسجيل الدخول root + كلمة مرور
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd","-D","-e"]
