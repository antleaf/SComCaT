# SComCat
Scholarly Communication Technology Catalogue, developed by [Antleaf](http://www.antleaf.com) for the [Confederation of Open Access Repositories (COAR)](https://www.coar-repositories.org) as part of the [Next Generation Libraries Project](https://educopia.org/next-generation-library-publishing/).

The development of this catalogue was funded by [Arcadia](https://www.arcadiafund.org.uk), a charitable fund of Lisbet Rausing and Peter Baldwin.

## To deploy

The following will deploy the software for an **empty** catalogue.

### Install all necessary ruby gems
Run `bundle install`

### Set environment variables

If you are running in "production", you will need to supply environment variables in whatever manner is supported in your production environment.

In "development" or "test" environments, you have the option of using a `.env` file in the application root folder (the folder containing this README file). Create a file in this root folder called `.env` by copying `.env_TEMPLATE`

In either case, the following environment variables are used in the application:

```bash
# these env variables are loaded by the dotenv gem but only in development or test environments.

### REQUIRED - settings for SMTP mailer used for "forgotten password" feature and for user feedback feature
SCOMCAT_SMTP_HOST='smtp.gmail.com'
SCOMCAT_SMTP_PORT=587
SCOMCAT_SMTP_DOMAIN='example.com'
SCOMCAT_SMTP_USERNAME='john-doe@example.com'
SCOMCAT_SMTP_PASSWORD=''
SCOMCAT_MAILER_FROM='john-doe@example.com'

### OPTIONAL - may be used for postgres deployment but not necessary (see ./config/database.postgres.yml)
SCOMCAT_POSTGRES_HOST=''
SCOMCAT_POSTGRES_PORT='5432'
SCOMCAT_POSTGRES_DB=''
SCOMCAT_POSTGRES_USER=''
SCOMCAT_POSTGRES_PASSWORD=''
```

The first set of environment variables are **necessary** to configure the SMTP mailer used to:
* send "forgotten password" messages
* send user feedback to the editors

A GMail account works just fine for this - but you are advised to get an 'application password' for this account rather than using the user account's password.

[Read more about application passwords for Google accounts here](https://support.google.com/accounts/answer/185833?hl=en)

The second section is **optional**, and mainly demonstrates how to configure a DB with ENV variables.

### Configure the database
SComCat should work just fine with any relational database system supported with an `ActiveRecord` adapter.

1. Create a database configuration file at `./config/database.yml` (several templates for different database systems are in the config folder).
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

