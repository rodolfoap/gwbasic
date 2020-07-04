FROM alpine:edge

RUN apk add --no-cache sdl libxxf86vm libstdc++ libgcc build-base sdl-dev linux-headers file

ADD [ "dosbox-0.74-3.tar.gz", "/build/" ]
RUN mkdir -p /dosbox && cd /build/dosbox-0.74-3 && ./configure --prefix=/usr && make -j$(nproc) && make install
RUN apk del build-base sdl-dev linux-headers && rm -R /build

ADD entrypoint /usr/local/bin
RUN chmod a+x /usr/local/bin/entrypoint

ENTRYPOINT [ "/usr/local/bin/entrypoint" ]
