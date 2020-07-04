FROM alpine:edge

ADD [ "dosbox-0.74-2.tar.gz", "dosbox-0.74.patch", "/build/" ]

RUN apk add --no-cache sdl libxxf86vm libstdc++ libgcc build-base sdl-dev linux-headers file \
 && mkdir /dosbox \
 && cd /build \
 && patch -p0 < dosbox-0.74.patch \
 && cd dosbox-0.74-2 \
 && ./configure --prefix=/usr \
 && make -j$(nproc) \
 && make install \
 && apk del build-base sdl-dev linux-headers \
 && rm -R /build

ADD entrypoint /usr/local/bin
RUN chmod a+x /usr/local/bin/entrypoint

# Mounting the config and data directory
VOLUME  [/root/.dosbox]
VOLUME  [/dosbox]

ENTRYPOINT [ "/usr/local/bin/entrypoint" ]
