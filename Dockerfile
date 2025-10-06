FROM almalinux:8
LABEL maintainer="jean <jean@localhost>"
RUN dnf -y update && \
    dnf -y install httpd net-tools curl && \
    dnf clean all
EXPOSE 80
RUN echo "<h1>Bienvenue sur le serveur Apache de Jean !</h1>" > /var/www/html/index.html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


