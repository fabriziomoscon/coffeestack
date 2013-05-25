CoffeeStack
===========

Node.js framework for web sites and web services based on a Domain model. 

Why using Coffeestack
---------------------
* Rapid Application Development for model based webservices in top of web sites (Single backend code to make API and web site)
* Achieve separation of concerns and code responsibilities with layered architecture (stop dumping code into the controller!)
* Using `MongoDB` as main data/session store and plugin other sources if you need to (file storage, NoSQL and Relational can live together)
* Create unit and functional testable applications (make testing your app fun)
* Validate inputs against the Domain Model (stop copy and paste rules into external validators or controllers, creating ONLY valid objects to pass down to the stack)
* Log errors, info and debug separately using `bunyan`

What is part of CoffeeStack
---------------------------
* environment based configuration [file](https://github.com/fabriziomoscon/coffeestack/blob/master/src/server/config.coffee) -> development, staging, testing, production
* controllers -> [basic authentication check and input validation](https://github.com/fabriziomoscon/coffeestack/blob/master/src/controller/User.coffee) 
* models -> [define the domain of the application](https://github.com/fabriziomoscon/coffeestack/blob/master/src/model/User.coffee)
* [db mappers](https://github.com/fabriziomoscon/coffeestack/blob/master/src/mapper/User.coffee) -> map DB data <-> model data
* [web service mappers](https://github.com/fabriziomoscon/coffeestack/blob/master/src/mapper/api/User.coffee) -> map model DATA <-> request specific DATA
* decorators -> add custom format to data before they render on HTML
* [repositories](https://github.com/fabriziomoscon/coffeestack/blob/master/src/repository/User.coffee) -> abstract calls to storages and map data usign db mappers
* [sources](https://github.com/fabriziomoscon/coffeestack/blob/master/src/source/mongo/User.coffee) -> technology specific API and data access 
* [two step view](https://github.com/fabriziomoscon/coffeestack/blob/master/view/twostep/user/create.coffee) -> use HTTP/1.1 `Accept` to switch response output 
* views -> `mustache` and template engine 
* `express` -> provide middleware layer to route and dispatch requests
* unit test suite using `mocha` and `should`
* functional test suite using [ciao](https://github.com/fabriziomoscon/coffeestack/blob/master/test/functional/json/user/create/success.coffee)


Updates status using David-dm
-----------------------------

[![Dependency Status](https://david-dm.org/fabriziomoscon/coffeestack.png)](https://david-dm.org/fabriziomoscon/coffeestack)

Ready to go
-----------

Download the code to create an initial web application setup and extend it as you wish.

```
git clone git@github.com:fabriziomoscon/coffeestack.git
```

Requirements
------------

```bash
sudo npm install -g ciao
sudo npm install -g mocha
sudo npm install -g coffee-script
sudo npm install -g bunyan
```

Setup
-----

In `~/.bash_profile` or equivalent:

```bash
export PATH=$PATH:./node_modules/.bin
export NODE_PATH=/usr/local/lib/node_modules:./
```

From the command line:

```bash
npm install
```

```bash
[sudo] npm install -g supervisor
```

Start Server
------------

```bash
npm run supervisor | bunyan
```

Browse localhost
-------------

[http://localhost:3000/](http://localhost:3000/)


Run Tests
---------

[![Build Status](https://travis-ci.org/fabriziomoscon/coffeestack.png?branch=master)](https://travis-ci.org/fabriziomoscon/coffeestack)

```bash
npm test
```

Functional test using ciao
--------------------------

install ciao globally
```bash
sudo npm install ciao -g
```

load fixtures
```bash
curl -XPOST http://localhost:4000/testing/drop
curl -XPOST http://localhost:4000/testing/fixtures
curl -XPOST http://localhost:4000/testing/fixtures/users
```

run the test

console1
```bash
npm run testing | bunyan
```

console2 (JSON)
```bash
ciao test/functional/json -c test/functional/ciao.json
```

console3 (HTML)
```bash
ciao test/functional/html -c test/functional/ciao.json
```

ubuntu
------

In order to run nodejs on lower port without root permission the following has been installed and executed
```bash
sudo apt-get install libcap2-bin
sudo setcap cap_net_bind_service=+ep /usr/bin/nodejs
sudo setcap cap_net_bind_service=+ep  /usr/local/lib/node_modules/coffee-script/bin/coffee
```

In order to switch between different versions of node we installed nave which can be used easly with the following
```bash
sudo nave usemain 0.10
```

Start the server as a daemon:

```bash
nohup npm run supervisor >> /var/www/app.log 2>&1 &
```

Database
--------

You can access collections and documents inside the database installing smog on your local machine

```bash
[sudo] npm install smog -g
```

and executing it
```bash
smog &
```

once smog is running open a browser to [http://localhost:8080/](http://localhost:8080/) and change `test` to `coffeestackDB` inside the DSN popup

NOTE

NODE_PATH='./:$NODE_PATH' and NODE_ENV='staging' must be in ~/.bashrc or exported in the current env

# Front-end

## Build environment

The front-end code is using [Jake] as a build tool.
Jake is installed by npm as one of the dev dependencies.
Jake can execute tasks from `Jakefile.coffee`.
Run `jake -T` to see a list of the available tasks.
Run `jake <task name>` to execute a task.
When a task depends on some other tasks,
those other tasks will be executed first.

## Style

CSS is compiled from Stylus code.
The Stylus middleware automatically recompiles
when changes are made.

## Updating CoffeeScript

There is a `watch` Jake task
that can be used to automatically
compile and bundle front-end CoffeeScript
when it is changed.

[jake]: https://github.com/mde/jake
