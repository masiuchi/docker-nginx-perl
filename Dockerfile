FROM perl:5.30.0

WORKDIR /root
RUN curl -O https://nginx.org/download/nginx-1.16.0.tar.gz
RUN tar xzvf nginx-1.16.0.tar.gz

WORKDIR /root/nginx-1.16.0
RUN ./configure --with-http_perl_module
RUN make
RUN make install

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /usr/local/nginx/logs/access.log \
	&& ln -sf /dev/stderr /usr/local/nginx/logs/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]

