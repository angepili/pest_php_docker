docker build . -t pest_php # --no-cache
docker run -d -p 80:80 --name pest_php_container -v "$PWD"/app:/var/www/html pest_php