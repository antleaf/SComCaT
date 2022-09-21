# SComCat

This repository is no longer under active development or maintenance. You may reuse the code and data subject to the respective licenses:

* **Code**: [MIT License](https://github.com/antleaf/SComCaT/blob/master/LICENSE)
* **Data:** [Creative Commons Attribution](https://creativecommons.org/licenses/by/4.0/)

This repository contains the source-code and data for the Scholarly Communication Technology Catalogue, developed by [Antleaf](http://www.antleaf.com) for the [Confederation of Open Access Repositories (COAR)](https://www.coar-repositories.org) as part of the [Next Generation Libraries Project](https://educopia.org/next-generation-library-publishing/).

![](./app/assets/images/Educopia_NextGen_PartnerLogoBanner_half_size.png)

![](./app/assets/images/antleaf_small_logo.png)

The development of this catalogue was funded by [Arcadia](https://www.arcadiafund.org.uk), a charitable fund of Lisbet Rausing and Peter Baldwin.

## To deploy

The following will deploy the software with all the data that had been added up to 2022-09-21.

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
```

The environment variables are **necessary** to configure the SMTP mailer used to:
* send "forgotten password" messages
* send user feedback to the editors

A GMail account works just fine for this - but you are advised to get an 'application password' for this account rather than using the user account's password.

[Read more about application passwords for Google accounts here](https://support.google.com/accounts/answer/185833?hl=en)

### Start the application
Run `rails server`

If running in development mode, go to `http://localhost:3000`

You can login withe a default admin account:

username: admin@example.com
password: changemenow

Now you can create more user accounts using the admin web interface.

