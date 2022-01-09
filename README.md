# README

When you add a new gem to Gemfile, run docker-compose build.

Regarding tailwindcss, when you change css class names, run docker-compose run web bundle exec rake assets:precompile.

To run this app on heroku as a docker app, make sure to prepend bundle exec for every command you run on heroku such as "heroku run bundle exec run ls -a appnamehere".

To format .html.erb files, run "htmlbeautifier app/views/\*/\*.html.erb"

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
