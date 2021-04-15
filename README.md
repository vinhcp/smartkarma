# SmartKarma

## Requirements
- [Docker CE](https://docs.docker.com/get-docker/)

## Installation
`docker-compose build`

## Running the App
`docker-compose up`

## Import data
After the docker-compose up, do `docker ps` it will give you a list of active docker containers. From that, you can get the DB container ID.

`docker exec -i {CONTAINER_ID} psql -U smartkarma -d smartkarma_development < db/data.sql`

## Testing
`docker-compose run --rm app rake db:create db:test:load RAILS_ENV=test`
`docker-compose run --rm app rspec`

## Optional: Install without docker
- Ruby 3.0.1
- Postgresql 13
