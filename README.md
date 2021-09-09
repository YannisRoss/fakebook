# Fakebook

A project that aims to mimic Facebook-like functionality.

  Part of TheOdinProject's curriculum. Relevant lesson: https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/rails-final-project

Deployed [here on Heroku](https://whispering-shelf-89077.herokuapp.com/) as of September 9th, 2021.

## Facebook Login

  Logging in with Facebook is implemented with the blue Facebook button at the top of the signup page, but **not fully functional on Heroku**. Facebook asks for specific privacy policies and usage collection terms that, as a personal project, Fakebook does not need. In a local dev environment, it authenticates fine with the [omniauth-facebook](https://github.com/simi/omniauth-facebook) option at the bottom.

### Getting started

  The app uses `ruby '2.7.4'` and `postgres` for the databases as indicated in the `Gemfile`. Before you clone the repo, make sure you have the appropriate Ruby version and postgres installed and set up.

### SendGrid integration

  The Heroku website has [SendGrid](https://devcenter.heroku.com/articles/sendgrid) integrated; users get a welcome email on signup. The mailer is named `UserNotifierMailer`, and its specific configuration is found in the `config/environment.rb` file. The `:password` required is the api key provided by SendGrid, and it is stored in an env var that Heroku sets up under the Settings tab of the app. 
