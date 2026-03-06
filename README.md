# Launching Dashjoin using Docker Compose

Dashjoin can be run in the following configuration

* Platform: the main Dashjoin Platform
* AIA: the AI backend
* MCP-Proxy: Allows installing MCP tools to be used by AIA
* Postgres: the database for both platform and AIA

Please check out this [tutorial](https://www.youtube.com/watch?v=MvhzcPOY3HM) as well.

## Cloning the Environment

First, clone the GitHub repository to get access to the environment:

```
git clone https://github.com/dashjoin/docker-compose
cd docker-compose
```

## Configuring your Settings

If you are running ollama (http://host.docker.internal:11434) locally, you are good to go.
To use RAG, make sure the embedding model is available:

```
ollama pull nomic-embed-text
```

If you want to use an external AI service, please enter your API key in the .env file.

The files mcp-proxy-config.json and settings.yml contain the default setup for your AI models and MCP servers.
Usually, there is no need to make changes here. 
Please refer to the [documentation](https://dashjoin.github.io/platform/latest/ai-ml-integration) for instructions
regarding configuring custom models.

## Starting

To start, stop, and delete the setup, run these commands:

```
# start containers
docker compose up

# stop containers
docker compose stop

# delete containers
docker compose down
```

If you are using Windows, the postgres database might not start due to the mounted volume.
Please use a named volume in this case.

## Volumes

In your working directory, you will find a folder called "volumes". It contains the persistent volumes for the dashjoin, aia, and postgres containers.
Note that the data is retained even after "docker compose down" is run. 

## Docker MCP

You can run MCP servers installed in the MCP toolkit in docker desktop. To expose them to clients, run this command:

```
source .env
export MCP_GATEWAY_AUTH_TOKEN=${MCP_GATEWAY_AUTH_TOKEN}
docker mcp gateway run --transport=http
```

## License

This software is licensed under the [PolyForm Free Trial License 1.0.0](https://polyformproject.org/licenses/free-trial/1.0.0/).
Please [contact us](https://dashjoin.com/#contact) to obtain an enterprise license.
