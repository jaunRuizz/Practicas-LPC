
Invoke-WebRequest -Uri "https://api.github.com/users/jaunRuizz/repos" | select-string  "url"> "C:\Users\mcdan\Desktop\Practica_#3\Mis-Repos-Encontrados\repos.txt"