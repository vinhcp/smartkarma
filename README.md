# SmartKarma

## Requirements
- [Docker CE](https://docs.docker.com/get-docker/)

## Installation
`docker-compose build`

### Add Database Configuration
`cp config/database.yml.sample config/database.yml`

### Create Databases
`docker-compose run --rm web rake db:create db:migrate db:seed`

## Running the App
`docker-compose up`

## Optional: Install without docker
- Ruby 3.0.1
- Postgresql 13

