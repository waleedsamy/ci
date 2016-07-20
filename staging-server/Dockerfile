FROM ubuntu:16.04
MAINTAINER Waleed Samy <waleedsamy634@gmail.com>

RUN apt-get update && apt-get install -y openssh-server

RUN useradd -m -s /bin/bash teamgreen

USER teamgreen

RUN mkdir ~/.ssh/ && chmod 700 ~/.ssh && \
    touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && \
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAshsuRXJfpAhbp+JWu4A9yHdd/7KhFbfq941HE7ks5OdQ35tN1Rg8Sli/feLGFWQ82jgsMcNQIJfTJoeHx3da8AkCre7x8pHghGIYWkDdhgbeM/IAgtdKOsSIXWTyXG7qZHWoLh2Sl+aFy3UMKbLZvWADHFIpUQR7q48YeWWYnBWTPpU8jrkJVb74FigbBco+iPuEbpJYSUtcGAj2CaGwd8jqW35x9bQcVTrACOWmqIAX29qC8LUaD09Nu0CCTNZ9NhWvLoL3uOcPoFagtyoVQC5hhEI/uh8kD2RQcj2XKTS0jgvFEmMXNUWSJohnaKJCzld2BcDTjyJhWl8YqoQyPRjt449n7gKgO96lP/GiIgp+I8L8WECzHsOjSufziqA6hVKM39EOSoP27+8YNiq+aDzMEig5pYI+XI5Xsl36XBxN4IpEAfgi2oZ9k7BeBrAFQiLiFZHSKTkFh2m6YUjPj9mQowyeaJlq7xKUbno5FRKElL7mgNBGzG9lAtp502YOQBL827fc0pobU3w7s7iPSklba2PLWgdTTZM16qaxdXnrNi9HYv0QsnytSYz0ySax1jBe7MzwmCa2ULPWAhtsjG6C389ZRSO1R/XoZGb6CqG7Ia1DxIty+ZCU099kvFp7AUpL78ab6NbO5btOCWmkll1+/AsEtuDtlQyQXZwcGQ== jenkins@traffics.de" >> ~/.ssh/authorized_keys && \
    mkdir -p ~/deployment

COPY deployment /home/teamgreen/deployment

USER root

RUN chown -R teamgreen:teamgreen /home/teamgreen/deployment

RUN mkdir /var/run/sshd
RUN echo 'root:green' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
