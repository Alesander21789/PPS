
 #Lo que hago es usar de base un contenedor ubuntu, en concreto con el tag latest el último en versión que esté disponible
FROM ubuntu:latest

#Ahora instalo Apache, php y mysql

# install Apache and PHP
#Actualiza la lista de paquetes disponibles en el sistema operativo base.
RUN apt-get update && \
#Instala el paquete tzdata
apt-get install -y tzdata && \
#Establece la zona horaria en Madrid, España, creando un enlace simbólico desde la zona horaria deseada en /usr/share/zoneinfo a /etc/localtime.
ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime && \
#Actualiza la configuración de tiempo de zona para que use la zona horaria seleccionada.
dpkg-reconfigure -f noninteractive tzdata && \
#Instala el paquete Apache en el sistema operativo base.
    apt-get install -y apache2 && \
    #Instala el módulo de PHP para Apache en el sistema operativo base.
    apt-get install -y libapache2-mod-php && \
    #Instala el paquete de PHP para MySQL en el sistema operativo base.
    apt-get install -y php-mysql
    
#Instala git
RUN apt-get install -y git
#Elimino el directorio porque si no me deja clonarlo porque el directorio no está vacío
#Descarga una aplicación PHP desde un repositorio de GitHub y la copia en el directorio web de Apache.
RUN rm -rf /var/www/html && git clone  https://github.com/banago/simple-php-website.git /var/www/html/


#Configuro apache para usar una aplicación php
#Agrega una línea al archivo de configuración de Apache para establecer el nombre del servidor como "localhost".
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

#Expone el puerto 80 para permitir el acceso a la aplicación PHP desde el host del contenedor.
EXPOSE 80

#Inicia el servidor Apache con el flag "-D FOREGROUND" para que el contenedor siga ejecutándose
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
