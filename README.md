# Jungle E-Commerce Web App

Welcome to Jungle, an e-commerce web app built with Ruby on Rails. This application allows users to browse, search, and purchase products from various categories.

## Features

- Browse and search products by category.
- View detailed product descriptions, prices, and availability.
- Add products to your cart and proceed to checkout.
- Apply discounts and view the final order total.
- User authentication and account management.
- Admin dashboard for managing products, categories, and sales.

## Screenshots

Insert screenshots of your application here. You can include images like:

![image](https://github.com/Fmoscovo/jungle/assets/128196275/f0556554-2bbe-4c93-b588-dca84f5973fb)

![image](https://github.com/Fmoscovo/jungle/assets/128196275/f0556554-2bbe-4c93-b588-dca84f5973fb)

## Video Demo


https://github.com/Fmoscovo/jungle/assets/128196275/5235dc26-7e2c-4278-b63c-d6fe6146a5a6



## Installation

1. Clone the repository:

   $ git clone https://github.com/Fmoscovo/jungle.git

   $ cd jungle

2. install dependencies: $ bundle install

3. Create and seed the database: $ rails db:setup

4. Start the server: $ rails server

5. Access the application at localhost:3000

## Additional Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4242424242424242 , CVC (any 3 digits) and DATE (any future date) for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

```

```
