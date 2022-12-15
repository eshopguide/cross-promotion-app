# Eshop Guide Cross Promotion App

A Rails Gem to integrate Eshop Guide cross promotion banners to the admin interface of other shopify apps.

## Dependencies && Requirements
* Ruby >=3.1
* Rails >=7.0
* NOTE: the app is designed to work with shopify apps that are build with the [shopify-rails-template](https://github.com/eshopguide/shopify_rails_template).
  For use in older apps see the [Special notes for legacy apps](#special-notes-for-legacy-apps) section.

## Installation

Add the gem to the application's Gemfile and run `bundle install`:
```ruby
gem 'cross_promotion_app', github: 'eshopguide/cross-promotion-app', '<Version>'
```

Run the generator to install the migrations and assets:
```bash
rails g cross_promotion_app
```

Finally check or change the credentials for the basic auth in your .env file:
```ruby
// CROSS_PROMOTION_APP
CROSS_PROMOTION_USER=<Username>
CROSS_PROMOTION_PASSWORD=<Password>
```

### Special notes for legacy apps

1. Make sure active storage is installed and configured. Run:
```bash
rails active_storage:install
```
2. If your App don't use an AuthenticatedController add the controller concern to find the banner to your admin ui controllers manually:
```ruby
  include CrossPromotionApp::FindBanner
```
3. Check your embedded_app.html.erb layout file and add the banner partial somewhere in the body element where you want it to be displayed:
```html
  <%= render 'cross_promotion_app/banner' %>
```

## Usage
The app is a Rails engine and can be mounted in any Rails app. The engine is namespaced under 'cross_promotion_app' and the root path is '/cross_promotion_app'.

Start the local server and visit `https://<LOCAL_NGROK_HOST_NAME>/cross_promotion_app` to see the app in action.

After deploying your host application to staging/production, visit `https://<HEROKU_APP_HOST_NAME>/cross_promotion_app` to see the app in action.

## Development
After checking out the cross-promotion-app repo, install dependencies and set up the database:
```bash
bundle install
bin/rails db:setup
```

To see changes in gem development immediately, install the gem in your local running host application. Open a console and set the local gem path with:
```bash
bundle config local.cross_promotion_app /path/to/cross-promotion-app
```
To the projects Gemfile add 
```ruby
gem 'cross_promotion_app', github: 'eshopguide/cross-promotion-app', branch: '<current local branch>'
```

and run `bundle install`.

For first use run the generator to install the migrations and assets:

```bash
rails g cross_promotion_app
```

## Release Process
TBC...

1. release a new version, update the version number in `version.rb` and create a git tag for the version:
```bash
git tag -a v<version> -m "Version <version>"
```
2. push the git commits and tags:
```bash
git push --tags
```


To create a new release from tag use the Github UI (see https://github.com/eshopguide/cross-promotion-app/releases)
or the command line tools (see https://cli.github.com/manual/gh_release_create).