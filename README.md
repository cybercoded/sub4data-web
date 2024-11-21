![Sub4Data Website](https://github.com/cybercoded/sub4data-web/blob/master/screenshots/public/logo.png)
# A web application for vending and recharging phone bills, electricity bill, water bill, TV subscriptions in Nigeria. 


## steps to get started

### Start the server side
1.  Clone the repo and cd into it
    > git clone https://github.com/kunley247/sub4data-web
    
1.  navigate into server-side folder
    > cd /laravel

1.  install or update composer to the environment
    > composer install 
    if error occurs run: 
    > composer update

1.  Rename or copy .env.example file to .env
    > cp .env.example .env

1.  Set your database credentials and order relevant information as you require in your .env file
    > https://github.com/kunley247/sub4data-web/blob/master/laravel/.env

1.  Generate Application key
    > php artisan key:generate

1.  Populate the database from 
    > https://github.com/kunley247/sub4data-web/blob/master/laravel/database/database.sql
    to your mysql admin

1.  Start the server-side server
    > php artisan serve

### Start the client side

1.  Navigate into client side folder
    > cd /react

1.  Install node_modules to the environment
    > npm install --legacy-peer-deps
    
    Fix any issues that may occur with dependencies
    > npm audit fix --force

1.  Start the client-side server
    > npm start


![Sub4Data Website](https://github.com/kunley247/sub4data-web/blob/master/frontend/public/logo.png)


