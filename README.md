# Eshop Guide Cross Promotion App

A Rails Gem to integrate Eshop Guide cross promotion banners to the admin interface of other shopify apps. 

## Installation

Install the gem and add to the application's Gemfile by executing:

TODO: Write installation instructions here

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bundle install` to install dependencies. Set up the database with `bin/rails db:setup`.

To see changes in gem development immediately, install the gem in local running app.
Open a console and set the local gem path with `bundle config local.eg_cross_promotion_app /path/to/eg-cross-promotion-app`.
Add `gem 'eg_cross_promotion_app', github: 'eshopguide/cross-promotion-app', branch: 'main'` to the projects Gemfile and run `bundle install`.

## Release

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag.
