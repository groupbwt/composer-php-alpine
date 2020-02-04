docker build . --file=Dockerfile -t composer-php7.0:latest --squash --build-arg VERSION=7.0
docker build . --file=Dockerfile -t composer-php7.1:latest --squash --build-arg VERSION=7.1
docker build . --file=Dockerfile -t composer-php7.2:latest --squash --build-arg VERSION=7.2
docker build . --file=Dockerfile -t composer-php7.3:latest --squash --build-arg VERSION=7.3
docker build . --file=Dockerfile -t composer-php7.4:latest --squash --build-arg VERSION=7.4

docker tag composer-php7.0:latest groupbwt/composer-php7.0:latest
docker tag composer-php7.1:latest groupbwt/composer-php7.1:latest
docker tag composer-php7.2:latest groupbwt/composer-php7.2:latest
docker tag composer-php7.3:latest groupbwt/composer-php7.3:latest
docker tag composer-php7.4:latest groupbwt/composer-php7.4:latest

docker push groupbwt/composer-php7.0:latest
docker push groupbwt/composer-php7.1:latest
docker push groupbwt/composer-php7.2:latest
docker push groupbwt/composer-php7.3:latest
docker push groupbwt/composer-php7.4:latest
