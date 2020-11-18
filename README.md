# ScomCat
Scholarly Communications Technology Catalogue

## To deploy

### Install all necessary ruby gems
Run `bundle install`

### Set environment variables
Create a file in this root folder called `.env` by copying `.env_TEMPLATE`

The first section of this configuration is **necessary** to configure the SMTP mailer used to:
* send "forgotten password" messages
* send user feedback to the editors

A GMail account works just fine for this - but you are advised to get an 'application password' for this account rather than using the user account's password.

[Read more about application passwords for Google accounts here](https://support.google.com/accounts/answer/185833?hl=en)

The second section is optional, and mainly demonstrates how to configure a DB with ENV variables.

### Configure the database
SComCat should work just fine with any relational database system supported with an `ActiveRecord` adapter.

1. Create a database configuration file at `./config/database.yml` - several templates for different database systems are in the config folder
2. Create the database(s): `rails db:create`
3. Migrate the database(s): `rails db:migrate`

### Configure an admin account and seed the database
Edit the file at `./db/seeds.rb`

Uncomment this section:
```ruby
user = User.new
user.email = ''
user.forenames = ''
user.lastname = ''
user.password = ''
user.password_confirmation = ''
user.roles << admin_role
user.roles << edit_role
user.roles << helpdesk_role
user.save!
```
and set values for the admin user for `email`, `forenames`, `lastname`, `password` and `password_confirmation`

Save your changes to `./db/seeds.rb` and run `rails db:seed`

### Start the application
Run `rails server`

If running in development mode, go to `http://localhost:3000`

You can login withe the account you configured in `./db/seeds.rb`. Now you can create more user accounts using the admin web interface.

