# Installation
* Clone this repo to your local development environment.
* Setup a local postgresql account username:`carecoordinator` password: `cc2016`. This account should simply be given super user permissions and the ability to create tables.
* Next create a new database called, `carecoordinator_development` and assign user `carecoordinator` as an owner.
* Next run, `bundle install`. This should install all dependancies for the project. 
* From the root directory of the project run `rake db:migrate`. This will create all the tables.
* Then run `rake db:seed`. This will populate all of the tables.
* Start the server with `rails server`.
* Visit `http://localhost:3000/test/index`. If you see the text `The test works`, then you have properly installed the application.


###Rake commands:
db:migrate runs (single) migrations that have not run yet.

db:create creates the database

db:drop deletes the database

db:schema:load creates tables and columns within the (existing) database following schema.rb

db:setup does db:create, db:schema:load, db:seed

db:reset does db:drop, db:setup



#Steps to follow to make changes to code

make sure repo is cloned

git checkout develop

git pull

git branch feature/yourFeatureName

git checkout feature/yourFeatureName

bundle install

rake db:migrate

rake db:seed

rails server

go to http://localhost:3000

if you see the Care Coordinator page it worked

make all your changes, make sure your code works by running ‘rails server’ after making a change to a file. you will not push anything until you finish your feature

once finished, push to your feature branch:

git add .

git commit -m “description of changes”

git push origin feature/yourFeatureName

git checkout develop

git merge feature/yourFeatureName

**Do not push to master! Only Bob will do this to make sure we dont break anything :) **
