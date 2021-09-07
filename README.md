# Fakebook

A project that aims to achieve Facebook-like functionality.

Part of TheOdinProject's curriculum. Relevant lesson: https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/rails-final-project

Deployed [here on Heroku](https://rocky-falls-06087.herokuapp.com/) as of September 7th, 2021.

## Facebook Login

Logging in with Facebook is implemented with the blue Facebook button at the top of the signup page, but **not fully functional on Heroku**. Facebook asks for specific privacy policies and usage collection terms that, as a personal project, Fakebook does not need. In a local dev environment, it authenticates fine with the [omniauth-facebook](https://github.com/simi/omniauth-facebook) option at the bottom.

### Getting started

The app uses `ruby '2.7.4'` and `postgres` for the databases as indicated in the `Gemfile`. Before you clone the repo, make sure you have the appropriate Ruby version and postgres installed and set up.

