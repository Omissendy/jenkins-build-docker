# Utilisation de l'image officielle Tomcat
FROM tomcat:9.0

# Auteur / mainteneur
LABEL maintainer="jean <jean@localhost>"

# Suppression des applications par défaut de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copie du fichier WAR généré par Maven dans Tomcat
COPY target/hello-world.war /usr/local/tomcat/webapps/ROOT.war

# Exposition du port de Tomcat
EXPOSE 8080

# Lancement du serveur Tomcat
CMD ["catalina.sh", "run"]



