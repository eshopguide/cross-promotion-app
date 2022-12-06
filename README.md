# Eshop Guide Cross Promotion App

A Rails Gem to integrate Eshop Guide cross promotion banners to the admin interface of other shopify apps. 

## Dependencies
* Ruby >=3.1
* Rails >=7.0

## Installation

Add the gem to the application's Gemfile and run `bundle install`:
```ruby
gem 'cross_promotion_app', github: 'eshopguide/cross-promotion-app', tag: '<Version>'
```

Run the generator to install the migrations and assets:
```bash
rails g cross_promotion_app
```

## Usage
The app is a Rails engine and can be mounted in any Rails app. The engine is namespaced under `cross_promotion_app` and the root path is `/cross_promotion_app`.

Start the local server and visit `https://<LOCAL_NGROK_HOST_NAME>/cross_promotion_app` to see the app in action.

After deploying the app to staging/production, visit `https://<HEROKU_APP_HOST_NAME>/cross_promotion_app to see the app in action.

## Development

After checking out the repo, run `bundle install` to install dependencies. Set up the database with `bin/rails db:setup`.

To see changes in gem development immediately, install the gem in local running app.
Open a console and set the local gem path with `bundle config local.eg_cross_promotion_app /path/to/eg-cross-promotion-app`.
Add `gem 'eg_cross_promotion_app', github: 'eshopguide/cross-promotion-app', branch: 'main'` to the projects Gemfile and 
run `bundle install`.

For first use run the generator to install the migrations and assets:
```bash
rails g cross_promotion_app
```

## Release

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, 
which will create a git tag for the version, push git commits and the created tag.
