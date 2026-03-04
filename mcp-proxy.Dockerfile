FROM ghcr.io/tbxark/mcp-proxy:v0.43.2

RUN apt-get update && apt-get install -y libsecret-1-0 && apt-get purge
