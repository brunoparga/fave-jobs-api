# README

This is the back-end Rails app I am submitting as part of a code challenge.

I prefer Rails APIs to be bare-bones apps, stripping away even more parts of the framework than just the `--api` option for `rails new`. They can always be added later if necessary (the YAGNI principle - You Ain't Gonna Need It.)

Here's the command that generated this directory:

`rails new fave-jobs-api --database=postgresql --api --skip-action-mailer --skip-active-storage --skip-action-mailbox --skip-action-text --skip-action-cable --skip-sprockets --skip-turbolinks --skip-test --skip-system-test --skip-javascript`

The app uses Ruby 2.6.5 with Rails 6.0.1 and a PostgreSQL database. Tests are initially disabled to make it easier to add RSpec later.
