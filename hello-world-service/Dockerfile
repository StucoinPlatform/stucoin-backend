FROM messense/rust-musl-cross:x86_64-musl AS chef
RUN apt-get update && apt-get install -y protobuf-compiler
RUN cargo install cargo-chef
WORKDIR /hello-world-service

FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

FROM chef AS builder
COPY --from=planner /hello-world-service/recipe.json recipe.json
RUN cargo chef cook --release --target x86_64-unknown-linux-musl --recipe-path recipe.json
COPY . .
RUN cargo build --release --target x86_64-unknown-linux-musl

FROM scratch AS hello-world-service

LABEL language="rust"
LABEL org.opencontainers.image.source https://github.com/StucoinPlatform/stucoin-backend

COPY --from=builder /hello-world-service/target/x86_64-unknown-linux-musl/release/hello-world-service-server /hello-world-service
ENTRYPOINT [ "/hello-world-service" ]
EXPOSE 50051