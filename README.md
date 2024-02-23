# A web application for vending and recharging phone bills, electricity bil, water bill, TV subscriptions in Nigeria. 


## steps to get started
1.  Clone the repo and cd into it
2.  navigate into server side folder
    > cd /laravel

3.  install or update composer to the environment
    > comoser install
    > composer update

3.  Rename or copy .env.example file to .env
    > cp .env.example .env

4.  Generate Application key
    > php artisan key:generate

5.  Set your database credentials in your .env file
    APP_NAME=Laravel
    APP_ENV=local
    APP_KEY= `php artisan key:generate will do the magic`
    APP_DEBUG=true
    APP_URL=http://localhost:
    
    ## set your database connection
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=laravel
    DB_USERNAME=root
    DB_PASSWORD=

6.  navigate into client side folder
    > cd /react

7.  Install node_modules to the environment
    npm install -g react-scripts ### to make node available globally
    > nmp install
    > php artisan serve

