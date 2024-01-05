FROM messense/rust-musl-cross:x86_64-musl AS chef
RUN apt-get update && apt-get install -y protobuf-compiler
RUN cargo install cargo-chef
WORKDIR /bff_service

FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

FROM chef AS builder
COPY --from=planner /bff_service/recipe.json recipe.json
RUN cargo chef cook --release --target x86_64-unknown-linux-musl --recipe-path recipe.json
COPY . .
RUN cargo build --release --target x86_64-unknown-linux-musl

FROM scratch AS bff_service

LABEL language="rust"
LABEL org.opencontainers.image.source https://github.com/cpprian/stucoin-backend

COPY --from=builder /bff_service/target/x86_64-unknown-linux-musl/release/bff_service /bff_service
ENTRYPOINT [ "/bff_service" ]
EXPOSE 50052