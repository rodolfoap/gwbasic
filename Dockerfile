FROM alpine:edge

RUN apk add --no-cache sdl libxxf86vm libstdc++ libgcc build-base sdl-dev linux-headers file nginx openrc
RUN rc-update add nginx default

ADD [ "assets/dosbox-0.74-3.tar.gz", "/build/" ]
RUN mkdir -p /dosbox && cd /build/dosbox-0.74-3 && ./configure --prefix=/usr && make -j$(nproc) && make install
RUN apk del build-base sdl-dev linux-headers

ADD [ "assets/gw-man.zip", "/build/" ]
RUN cd /build/ && unzip gw-man.zip && mv -v GW-MAN /usr/local/www && chown -R nginx: /usr/local/www
RUN rm -R /build

COPY assets/gwbasic.exe /usr/local/bin
COPY assets/dosbox.conf /usr/local/bin
COPY assets/default.conf /etc/nginx/conf.d/default.conf
ADD assets/entrypoint /usr/local/bin
RUN chmod a+x /usr/local/bin/entrypoint

ENTRYPOINT [ "/usr/local/bin/entrypoint" ]
WORKDIR /usr/local/bin
