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

* Commands

rake db:migrate [RAILS_ENV=test]
rails g integration_test  listing_books
rails g model book title rating:integer --no-fixture
rake db:seed
curl http://localhost:3000/books
rake routes
rails g migration add_finished_at_to_books finished_at:datetime
rails g integration_test creating_books
rails g integration_test deleting_books
rails g serializer book
rails g model genre name --no-fixture
