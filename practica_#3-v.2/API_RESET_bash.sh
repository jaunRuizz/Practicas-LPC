#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------------------------------------
# Esta linea de codigo solicita el usuario de git hub para traerte los repositorios
ver_repos () {
    echo Escribe tu nombre de usuario de Git hub
    
    read user
    
    ## Esta linea de codigo hace la llamada a los servidores de github para obtener los repositorios del usuario y los guarda en un txt
    curl -s  "https://api.github.com/users/$user/repos" | grep "^    \"url\""|cut -d "\"" -f 4 | head -n 30
}
#-----------------------------------------------------------------------------------------------------------------------------------------------------
generar_txt () {
echo Escribe tu nombre de usuario de Git hub

read user

#En esta linea de codigo se le el contenido de repo y se almacenan solo los repositorios existentes en otro txt limpio
curl -s  "https://api.github.com/users/$user/repos" > Repos.txt
    cat repos.txt | grep "\"name\"" |cut -d "\"" -f 4 | head -n 30  > "C:\Users\mcdan\Desktop\Practica_#3\Mis-Repos-Encontrados\repositorios.txt"
    echo Se creo archivo con exito
    
    ## Esta linea de codigo es para que se imprima en pantalla el contenido de el txt repositorios
    #for i in `cat repos.txt`;
    #do
    #    echo $i;
    #done
}
#------------------------------------------------------------------------------------------------------------------------------------------------------
generar_txt_commits () {
    
    #En esta linea de codigo se le el contenido de repo y se almacenan solo los repositorios existentes en otro txt limpio
    cat repos.txt | grep "\"name\"" |cut -d "\"" -f 4 | head -n 30  > "C:\Users\mcdan\Desktop\Practica_#3\name_repos.txt"
    #segunda solicitud a la api
    echo Escribe tu nombre de usuario de Git hub
    
    read user
    c=1
    for i in `cat "C:\Users\mcdan\Desktop\Practica_#3\name_repos.txt"`
    do
        curl -s https://api.github.com/repos/$user/$i/commits > "C:\Users\mcdan\Desktop\Practica_#3\commits\commits$c.txt"
        c=$(($c+1))
    done
    
}

#-------------------------------------------------------------------------------------------------------------------------------------------------------












#--------------------------------------------------------------------------------------------------------------------------------------------------------
#Este es el ciclo while que se encargara de mostrar el menu en todo momento
op=0
while [ $op -ne 9 ]; do
    # Este es el panel de opciones para elejir las diferentes acciones
    
    echo [1] Ver repositorios
    echo [2] Generar txt con repositorios
    echo [3] generar txt de commits
    echo [4] Ver info de los repositorios
    echo [9] Salir del script
    #
    read -p "Seleciona una opcion " op
    # Este es el case que se encargara de llamar a lar funciones segun el usuario elija cada una de las opciones
    case $op  in
        1)
            ver_repos
        ;;
        2)
            generar_txt
        ;;
        3)
            generar_txt_commits
        ;;
        4)
            echo 4
        ;;
        9)
            echo Hasta luego cuidate
        ;;
        #...
        *)
            echo Error opcion invalida _521_
        ;;
    esac
done