# Fave Jobs API

## About this app

This is the back-end Rails app I am submitting as part of [Get on Board's code challenge](https://gist.github.com/j4rs/1e4c1e37e063fd5143b8b9ed18329730).

The [front-end app](https://github.com/brunoparga/fave-jobs-react) has to display to the user the job offers they have favorited, so that needs to be saved in a database and served to the front-end; that is the purpose of this app. It does so by means of a Ruby on Rails API connected to a PostgreSQL database.

## Setup

Let's look at how to get this API deployed.

### Install

First of all, clone this repository into your machine:

```
git clone https://github.com/brunoparga/fave-jobs-api.git
```

Install the gems the app depends on, set up the database ([you need to have PostgreSQL installed](https://www.postgresql.org/download/)) and fire up the server:

```
bundle install
rails db:create db:migrate db:seed
rails server
```

In your browser, navigate to <http://localhost:3000>. You should see the default Rails welcome view (\o/ YAY \o/), showing you the server works. Going to <http://localhost:3000/jobs> will give you a JSON string - this is what the API is supposed to do!

Optionally, you could add a browser extension like [this one](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa) for Google Chrome that will prettify the JSON output and make it clearer what is going on: the API initially serves only the very job offer this challenge refers to 😊 the front-end app has the ability of adding more favorites, please refer to its documentation.

### Deploy

Now let's deploy the app to Heroku. You'll need the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) to run:

```
heroku create [optional app name]
```

The URL of the app (ending with `herokuapp.com`) can be placed in `src/ducks/jobs.js` on the front-end app so that your instance of the front-end connects to your instance of the back-end. However, this also requires that the back-end recognize requests from the front-end, which can be done by replacing my GitHub Pages domain with yours in `config/initializers/cors.rb`.

If you change that or make other changes to the app, do not forget to deploy them to Heroku!

```
git add .
git commit -m "Configure CORS with front-end domain"
git push heroku master
```

### Test

Finally, you'll want to run the test suite:

```
rspec
```

That should be all. Happy favoriting jobs!

## Technical decisions

I prefer Rails APIs to be bare-bones apps, stripping away even more parts of the framework than just the `--api` option for `rails new`. They can always be added later if necessary (the YAGNI principle - You Ain't Gonna Need It.)

Here's the command that generated this directory:

`rails new fave-jobs-api --database=postgresql --api --skip-action-mailer --skip-active-storage --skip-action-mailbox --skip-action-text --skip-action-cable --skip-sprockets --skip-turbolinks --skip-test --skip-system-test --skip-javascript`

The app uses Ruby 2.6.5 with Rails 6.0.1 and a PostgreSQL database. Tests are initially disabled to make it easier to add RSpec later.

No gems that are too unusual were added to the app. `pry-byebug` mixes the default `byebug` debugging gem with `pry`, the alternative REPL to `irb`. The `rack-cors` middleware was activated to allow Cross-Origin Resource Sharing between the back and the front-end.

## Progress report

The API started with a seed, based on the sample query provided in the challenge; that has been weeded out to only one job, as a proof of concept.

The original structure envisioned for the 'jobs' database table had only two fields, a `favorite` boolean and a `data` JSON field containing everything received from the external API. However, accessing this field proved difficult, so now the structure is a lot flatter, with only the nested `company` data being stored as JSON.

This documentation is now complete, as is the app's functionality; all that is left in the project is implement the tests. If I was starting this project anew, with what I learned from it, I would probably stick to my original idea of storing the data from the API as a JSONB field. There is basically no manipulation of the incoming data, it is just stored as-is in the database and retrieved equally as-is.

## To do

- the `#destroy` controller action should return a status code of 204 and no body; the `api_id` of the deleted job will be sent in a header.