#Elijo la imagen de docker que voy a usar, en este caso una php:7.4-cli, pongo el TAG 7.4-cli que es la versión que quiero
FROM php:7.4-cli
#Copio la aplicación php desde la ruta hasta /var/www/html

ADD simple-php-website /var/www/html


#Expongo el puerto 8080

EXPOSE 8080

#Ejecuto el comando CMD que lo que hará es,
# ejecutar el comando php con las opciones -S,
# que sirve para indicarle que se inicie un servidor web interno,
# 0.0.0.0:8080, que es la dirección ip y el puerto porque escuchará el servidor web interno,
#0.0.0.0 significa que escuchará en todas las direcciones ip que hay en el la máquina,
#la opción -t es para indicar la raíz del servidor web, en este caso "/var/www/html"

#En resumen,
# esta línea ejecuta el comando para iniciar un servidor web interno de PHP en el puerto 8000 y utilizando el directorio "/var/www/html" como raíz del servidor, 
#de esta manera se podrá acceder a la aplicación en PHP desde el navegador web en la dirección http://localhost:8000.

CMD ["php","-S","0.0.0.0:8080","-t","/var/www/html"]
