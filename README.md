# SmartKarma

## Requirements
- [Docker CE](https://docs.docker.com/get-docker/)

## Installation
`docker-compose build`

## Running the App
`docker-compose up`

### Import data
After the docker-compose up, do `docker ps` it will give you a list of active docker containers. From that, you can get the DB container ID.

`docker exec -i {CONTAINER_ID} psql -U smartkarma -d smartkarma_development < db/data.sql`

## Optional: Install without docker
- Ruby 3.0.1
- Postgresql 13
