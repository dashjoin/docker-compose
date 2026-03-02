FROM ghcr.io/tbxark/mcp-proxy:latest

RUN apt-get update && apt-get install -y libsecret-1-0 && apt-get purge
