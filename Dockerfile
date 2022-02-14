FROM vault:latest

RUN update-ca-certificates
COPY vault/config.hcl /vault/config