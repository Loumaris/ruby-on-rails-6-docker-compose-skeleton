# ruby on rails 6 docker-compose skeleton

This is a small skeleton for kick starting a new ruby on rails 6 application based on `yarn`, `postgreSQL`
and `ruby on rails` inside a `docker-compose` environment.

The basic rails project has been generated with: `rails new rails-docker-compose-skeleton -d postgresql`

## tech specs

* ruby 2.7.1
* rails 6.0.3.2
* postgreSQL 10.5

## usage

```shell

# clone this repository
git clone git@github.com:Loumaris/ruby-on-rails-6-docker-compose-skeleton.git <project-name>

# go into the new project and remove the git
cd <project-name>
rm -rf .git

# create a new git tracking
git init
git add .
git commit -m "init commit"

# create a new `/config/master.key`

# build and run docker-compose
docker-compose build

# create db
docker-compose run rails-app rails db:create

# run migrations
docker-compose run rails-app rails db:migrate

# start rails
docker-compose up

# access the rails container during the "uptime"
docker-compose exec rails-app bash
```

That's it ;-)

## copy cat / dockerize existing projects

If you want to dockerize an existing project, you need to copy the following files:

* `Dockerfile`
* `docker-compose.yaml`
* `config/database.yaml`
* `.docker.env`
* `lib/tasks/loumaris.rake`
* `.dockerignore`
