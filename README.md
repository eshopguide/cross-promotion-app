# Eshop Guide Cross Promotion App

A Rails Gem to integrate Eshop Guide cross promotion banners to the admin interface of other shopify apps.

## Dependencies && Requirements
* Ruby >=3.1
* Rails >=7.0
* Make sure active storage is installed and configured. Run: ```rails active_storage:install```
  * Don't forget to set up the storage cloud service for the production environment in config/storage.yml and to set `config.active_storage.service` in the environment config
* npm packages: `react, react-i18next, @shopify/app-bridge-react, @shopify/polaris`
* NOTE: the app is designed to work with shopify apps that are build with the [shopify-rails-template](https://github.com/eshopguide/shopify_rails_template).
  For use in older apps see the [Special notes for legacy apps](#special-notes-for-legacy-apps) section.

## Install the gem in your host application

Add the gem to the application's Gemfile and run `bundle install`:
```ruby
gem 'cross_promotion_app', '<Version>', github: 'eshopguide/cross-promotion-app'
```

Run the generator to install the migrations and assets:
```bash
rails g cross_promotion_app
```

Update your Vite config to be able to import the React `<CrossPromotionBanner />` component:
```
import { defineConfig, searchForWorkspaceRoot } from 'vite';
import { execSync } from 'child_process';

const gemPath = execSync(`bundle show cross_promotion_app`, { encoding: 'utf-8' }).trim();

export default defineConfig({
  [...]
  server: {
    fs: {
      allow: [
        searchForWorkspaceRoot(process.cwd()),
        gemPath
      ]
    }
  },
  resolve: {
    alias: {
      'cross-promotion-app': gemPath,
    }
  }
})
```

Import the banner component in your React frontend:
```
import { CrossPromotionBanner } from 'cross-promotion-app';
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

2. Check your .env file for the HOST_NAME key and add it if it's missing:
```ruby
HOST_NAME=<host_name>
```

## Host Application Deployment
Before deploying your host application to staging/production make sure to add the new secrets.

After deploying visit `https://<HEROKU_APP_HOST_NAME>/cross_promotion_app` to see the app in action.

## Gem Development
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