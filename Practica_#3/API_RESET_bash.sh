#-------------------------------------------------------------------------------------------------------------------------------------------------------
## Esta linea de codigo solicita el usuario de git hub para traerte los repositorios
#echo Escribe tu nombre de usuario de Git hub
#
#read user
#
### Esta linea de codigo hace la llamada a los servidores de github para obtener los repositorios del usuario y los guarda en un txt
#curl -s  "https://api.github.com/users/$user/repos" > repos.txt
#
##En esta linea de codigo se le el contenido de repo y se almacenan solo los repositorios existentes en otro txt limpio
#cat repos.txt | grep "^    \"url\""|cut -d "\"" -f 4 | head -n 30  > "C:\Users\mcdan\Desktop\Practica_#3\Mis-Repos-Encontrados\repositorios.txt"
#
#
### Esta linea de codigo es para que se imprima en pantalla el contenido de el txt repositorios
#for i in `cat C:/Users/mcdan/Desktop/Practica_#3/Mis-Repos-Encontrados/repositorios.txt`;
#do
#    echo $i;
#done
#-------------------------------------------------------------------------------------------------------------------------------------------------------
#segunda solicitud a la api
#echo Escribe tu nombre de usuario de Git hub
##
#read user
#
#echo ingresa el bnombre del repositorio del que quieres obtener los commits
#
#read repo
#
#curl -s https://api.github.com/repos/$user/$repo/commits > commits.txt


#--------------------------------------------------------------------------------------------------------------------------------------------------------
# Este es el panel de opciones para elejir las diferentes acciones 

echo Elije una opcion [1] Ver repositorios [2] Generar txt con repositorios [4] generar txt de commits [5] 
read op
while [$op -ne 9]
do
    case $op  in
      1)
        echo 1
      ;;
      2)
        echo 2
      ;;
       3)
       echo 3
     ;;
     4)
       echo 4
     ;;
    #...
      *)
        echo Error opcion invalida _521_
      ;;
    esac
done