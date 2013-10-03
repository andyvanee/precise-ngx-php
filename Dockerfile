FROM ubuntu

MAINTAINER Andy Vanee "1andyvanee@gmail.com"

# Build the site.
ADD . /app
EXPOSE 80
RUN /app/build_docker.sh

CMD service php5-fpm start && nginx
