# README

This is the back-end Rails app I am submitting as part of a code challenge.

I prefer Rails APIs to be bare-bones apps, stripping away even more parts of the framework than just the `--api` option for `rails new`. They can always be added later if necessary (the YAGNI principle - You Ain't Gonna Need It.)

Here's the command that generated this directory:

`rails new fave-jobs-api --database=postgresql --api --skip-action-mailer --skip-active-storage --skip-action-mailbox --skip-action-text --skip-action-cable --skip-sprockets --skip-turbolinks --skip-test --skip-system-test --skip-javascript`

The app uses Ruby 2.6.5 with Rails 6.0.1 and a PostgreSQL database. Tests are initially disabled to make it easier to add RSpec later.

## Progress report

The API currently works with a seed, based on the sample query provided in the challenge. It is able to locate a specific job based on its external API id.

The original structure envisioned for the 'jobs' database table had only two fields, a `favorite` boolean and a `data` JSON field containing everything received from the external API. However, accessing this field proved difficult, so now the structure is a lot flatter, with only the nested `company` data being stored as JSON.

## TODOs

The API will have to deal with search requests from the front-end; use of the `pg_search` gem is envisaged. Regardless of the search term, all of the favorite jobs will still have to be served.

Toggling favorite status.

Tests.
