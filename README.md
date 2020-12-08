# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version  
  2.7.1

* System dependencies

  - PostgreSQL on Docker  

    To create the container (run only once):  

      `$ docker run --name onebithealth_postgres -e POSTGRES_PASSWORD=dockerpqsql -d -p 5433:5432 postgres`

    To run the container:  

      `$ docker start onebithealth_postgres`

* Configuration

* Database creation  

    `$ rails db:create`

* Database initialization
  `$ rails db:migrate`

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
