# README

## Development log

### Gem configuration
Added following gems to `Gemfile`:

```ruby
gem 'haml-rails', '~>2.0.1'
gem 'friendly_id', '~>5.3.0'
gem 'acts-as-taggable-on', '~>6.5.0'
gem 'devise','~>4.7.1'
gem 'pundit','~>2.1.0'
gem 'backup', '~>5.0.0.beta.2'
gem "audited", "~> 4.9"
```

Commented out this line from `Gemfile`:
`gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]`

Ran:

```bash
bundle install
bundle update
```

### Converted to HAML
```bash
rails generate haml:application_layout convert
rails haml:erb2haml
```

### Added Audited support
```bash
rails generate audited:install
rake db:migrate
```

### Configured Acts as taggable
Ran:
```bash
rake acts_as_taggable_on_engine:install:migrations
```

### Created `Home` controller
```bash
rails generate controller Home index
```

### Added home route to `routes.rb`
```ruby
root 'home#index'
```

### Configured Devise
```bash
rails generate devise:install
```
Edited `config/environments/development.rb` to add:
```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

```bash
rails generate devise User
rails db:migrate
rails generate devise:views
rails haml:erb2haml
```

### Configured Pundit
```bash
rails g pundit:install
```

Include Pundit in your application controller:

```ruby
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
end
```

### Configured Bootstrap (vis Webpack) with Datatables
```bash
yarn add bootstrap jquery popper.js
```

In `config/webpack/environment.js` include the following:

```javascript
const { environment } = require('@rails/webpacker');
const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
}));
module.exports = environment;
```

In `app/javascript/packs/application.js` add the following:

```javascript
require("bootstrap/dist/js/bootstrap");
```

In `app/assets/stylesheets/application.css` add the following:
```css
*= require bootstrap/scss/bootstrap
```

Edit `package.json` to include:
```json
"datatables.net-bs4": "^1.10.20",
````
<!--
```bash
yarn add http://datatables.net-bs4 
```
-->

### Created  scaffold:
```bash
rails generate scaffold AdoptionLevel name:string description:string notes:text slug:uniq
rails generate scaffold Category name:string description:string notes:text slug:uniq
rails generate scaffold Function name:string description:string notes:text slug:uniq
rails generate scaffold ReadinessLevel name:string description:string notes:text slug:uniq
rails generate scaffold Technology name:string description:string url:string notes:text slug:uniq adoption_level:references readiness_level:references
rails generate scaffold Relationship predicate:string subj:references obj:references
rails generate scaffold Role name:string description:string
rails generate scaffold Assignment user:references role:references
```

### Created join tables for HABTM
```bash
rails generate migration CreateJoinTableTechnologyCategory technology category
rails generate migration CreateJoinTableTechnologyFunction technology function
```

### Added slugs for friendly_find
```bash
rails generate migration AddSlugToAdoptionLevels slug:uniq
rails generate migration AddSlugToFunctions slug:uniq
rails generate migration AddSlugToReadinessLevels slug:uniq
rails generate migration AddSlugToCategories slug:uniq
rails generate migration AddSlugToTechnologies slug:uniq
rails generate migration AddSlugToRoles slug:uniq
```

### Add Admin controller
```bash
rails generate controller Admin index
```

### Add D3
```bash
yarn add d3
```





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
