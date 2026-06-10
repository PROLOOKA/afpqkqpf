FROM alpine:latest

RUN apk add --no-cache openssh

# إنشاء مجلد ssh
RUN mkdir -p /run/sshd

# تعيين كلمة مرور الروت
RUN echo "root:lookmora" | chpasswd

# تفعيل تسجيل الدخول للروت بكلمة مرور
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
