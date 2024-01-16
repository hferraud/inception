FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install nginx openssl -y

COPY ./config/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl

# -x509: certificate type
# -nodes: disable password
# -out: certificate file
# -keyout: key certificate file
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/certificate.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hferraud.42.fr/UID=hferraud"

CMD ["nginx"]
