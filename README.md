# Build Local AI Apps with a few Clicks

The features include:

* Local install supporting ollama
* Multimodal chat
* Retrieval Augmented Generation (incl. automated doc import)
* MCP tool support (web search, file access, O365)
* Custom tools implemented using the Dasjoin Platform and JSONata

Please check out this tutorial:

<a href="https://www.youtube.com/watch?v=MvhzcPOY3HM"><img src="https://img.youtube.com/vi/MvhzcPOY3HM/mqdefault.jpg"></a>

## Containers

Dashjoin can be run in the following configuration

* [Platform](https://github.com/dashjoin/platform): the main Dashjoin Low Code Platform
* AIA: the AI backend
* MCP-Proxy: Allows installing MCP tools to be used by AIA
* Postgres: the database for both platform and AIA

## Getting Started

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

## Volumes

In your working directory, you will find a folder called "volumes". It contains the persistent volumes for the dashjoin and aia containers. The named volume "postgres" is used for the postgres database container (docker volume ls).

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
