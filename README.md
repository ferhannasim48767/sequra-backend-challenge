
#### Rails
Rails version for this project is `6.1.3`
Ruby version for this project is `2.7.0`

### Cloning the Repository
For cloning the Github repository and goto the project follow the following commands
```
git clone https://github.com/ferhannasim48767/sequra-backend-challenge.git
cd project_name
```

#### Project Dependencies

To setup the project, follow the below commands in the project directory.
```
gem install bundler
bundle install
```
This will install all the required gems for the project on your system.

#### Creating postgres db role
To setup psql db role one can go to the psql console by the following command and create role respectively.

```
psql postgres
$ create role postgres with createdb login password '123456';
```
```
#### Create and Migrate db
For setting up the migrations on your system, run the following commands on your system:
```
rails db:create
rails db:migrate
rails db:seed
rails s

hit this: http://localhost:3000

#### To run test cases
For executing test cases on your system, run the following command on your system:
rspec

### To view API documentation,run the following command.
rails rswag

Documentation:

http://localhost:3000/merchants To create merchants click on 'New Merchant'
http://localhost:3000/shoppers To create merchants click on 'New Shopper'
you can create new order from this url http://localhost:3000/orders/new
First, mark your orders as complete then you can calculate the disbursement fee.
I have also added a scheduler that will run the disbursement fee calculation job on every Monday.

I have added swagger for API Documentation.
create disbursment fee API: http://localhost:3000/merchants/get_orders.json (Request Type: Get) in case you want to test it on postman.
Here is the link for that, we can further add security on this, so not everybody can have access to this URL.
API documentation URL: http://localhost:3000/api-docs/index.html, don't forget to run this command 'rails rswag', otherwise nothing will be shown.
Now enter id: 3 and week: 29, data of the merchant having id 2 of 29th week will be displayed.

