# Dockerfile — минимальный пример
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y --no-install-recommends python3 \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /var/www
COPY setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh
ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/setup.sh \"$0\" && python3 -m http.server 8080"]

