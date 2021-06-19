FROM  rust:1.53.0 as builder
WORKDIR /usr/src/rust-server
COPY . .
RUN cargo install --path .

FROM rust:1.53.0
#RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/rustdesk-server /usr/local/bin/rustdesk-server
ENV IP="192.168.60.10"
EXPOSE 21116/UDP
EXPOSE 21115/TCP
EXPOSE 21116/TCP
EXPOSE 21117/TCP
CMD ["rustdesk-server"]