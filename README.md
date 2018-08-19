# Shopify Loyalty App

This is a starter app gives loyalty points to Customers on each purchase. This app will get you quickly started with a working shopify application.

## Versions

- Ruby 2.4.1
- Rails 5.1.6

## Features

- [Ruby on Rails 5.0](http://rubyonrails.org/)
- [Twitter Bootstrap](https://github.com/seyhunak/twitter-bootstrap-rails)
- [Rspec](https://github.com/rspec/rspec-rails)
- [Shopify App](https://github.com/Shopify/shopify_app)

## Quick Start

```
$ bundle install
```

### Database

```
$ rails db:create
$ rails db:migrate
```

## How to run the test suite

```
$ bundle exec rspec
```

## Heroku

https://infinite-shelf-30866.herokuapp.com/

## Details

To install this application: Open the above mentioned heroku url and enter the shop url in the box and click Install. And then click Install again to get this app with your shopify store. Once this app is install and any order gets paid then it will start calculating the loyalty points equalent to the dollar spent by the customer for each order. It will show the details related to each Customer and related points.

## Point to Note

To use this app directly, you need to add api_key and secret to your environment variables. You an look at config/shopify_app.yml to get better idea
