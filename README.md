# Installation
* Clone this repo to your local development environment.
* Setup a local postgresql account username:`carecoordinator` password: `cc2016`. This account should simply be given super user permissions and the ability to create tables.
* Next create a new database called, `carecoordinator_development` and assign user `carecoordinator` as an owner.
* Next run, `bundle install`. This should install all dependancies for the project. 
* From the root directory of the project run `rake db:migrate`. This will create all the tables.
* Then run `rake db:seed`. This will populate all of the tables.
* Start the server with `rails server`.
* Visit `http://localhost:3000/test/index`. If you see the text `The test works`, then you have properly installed the application.