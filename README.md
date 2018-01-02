# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

rake db:migrate
rails g integration_test  listing_books
rails g model book title rating:integer --no-fixture
db:migrate RAILS_ENV=test
