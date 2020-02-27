# README

This app can help you (barely) run a simple restaurant.

* Ruby version: 2.3.4p301

* Rails version: 5.1.7

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app!

```
$ rails server
```
