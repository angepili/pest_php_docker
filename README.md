## Init immagine
docker build . -t angelphp # --no-cache

# Crea container
docker run -d -p 80:80 --name angelphp_container -v "$PWD"/app:/var/www/html angelphp

# Start & Stop container
docker start angelphp_container
docker stop angelphp_container

# Run operations
docker exec -it angelphp_container /bin/bash