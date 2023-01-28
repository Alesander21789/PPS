#!/bin/bash

Crea un arreglo para almacenar los nombres de los contenedores
container_names=()

Ciclo a través de los puertos desde 8000 hasta 8019
for i in {0..19}; do
# Calcular el número de puerto actual
port=$((8000+$i))
# Crea una variable para almacenar el nombre del contenedor
container_name="ejercicio2_$port"
# agrega el nombre del contenedor al arreglo
container_names+=("$container_name")
echo "Inciiando $container_name en el puerto $port"
# Ejecuta el contenedor y asigna el puerto del host al puerto 80 del contenedor
# le da al contenedor el nombre especificado por la variable container_name
# ejecuta el contenedor en modo demonio
# usa la imagen ejercicio2:v2
docker run -p $port:80 --name $container_name -d ejercicio2:v1
done

Imprime un mensaje indicando que el script ha terminado de ejecutarse
echo "Los siguientes contenedores han sido iniciados:"

Ciclo a través del arreglo de nombres de contenedores e imprimir cada uno
for container_name in "${container_names[@]}"; do
echo " - $container_name"
done

#Este script crea un array para almacenar los nombres de los contenedores y mapea los puertos desde 8000 hasta 8019. Luego crea una variable para almacenar el nombre del #contenedor y lo agrega al array. El script ejecuta el contenedor y asigna el puerto del host #al puerto 80 del contenedor, le da al contenedor el nombre especificado por la variable #container_name, ejecuta el contenedor en modo desconectado y usa la imagen ejercicio2:v2. #Después del ciclo, el script imprime un mensaje indicando que el script ha terminado de #ejecutarse y ciclo a través del array de nombres de contenedores e imprimir cada uno.


#En esta última instrucción pido por pantalla si deseo cerrar los contendores y después eliminarlos,
#en el caso de que sea no, no hace nada, simplemente muestra que los contenedores no serán eliminados,
#en el caso de que sea si, recorre el array con los nombres de los contenedores,
#hace un docker stop de dichos contenedores y, por último, hace un docker kill de chicos contenedores
echo "¿Desea cerrar y eliminar los contenedores abiertos? (sí/no)"
read input
if [[ $input == "sí" || $input == "yes" ]]; then
    for container_name in "${container_names[@]}"; do
        echo "Cerrando y eliminando $container_name"
        docker kill $container_name
        docker rm $container_name
    done
    echo "Todos los contenedores han sido eliminados"
else
    echo "Los contenedores no serán eliminados"
fi
