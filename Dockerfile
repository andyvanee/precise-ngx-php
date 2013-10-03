FROM andyvanee/nginx

# Build the site.
ADD . /app
EXPOSE 80
RUN /app/build_docker.sh

CMD service php5-fpm start && nginx
