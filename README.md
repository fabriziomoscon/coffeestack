Setup
-----

In `~/.bash_profile` or equivalent:

```bash
export PATH=./node_modules/.bin:$PATH
export NODE_PATH=./:$NODE_PATH
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
npm start
```

Browse localhost
-------------

[http://localhost:3000/](http://localhost:3000/)


Run Tests
---------

```bash
npm test
```

Functional test using ciao
--------------------------

install ciao globally
```bash
sudo npm install ciao -g
```

Drop current test DB and create valid user sessions for all those tests requiring authentication
```bash
coffee ciao/ciao.coffee
```

run the test

console1
```bash
npm run testing
```

console2 (JSON)
```bash
coffee ciao/ciao.coffee && mongo test && ciao -c ciao/generated.json test/functional/ciao/json
```

console3 (HTML)
```bash
coffee ciao/ciao.coffee && ciao -c ciao/generated.json test/functional/ciao/html
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

once smog is running open a browser to [http://localhost:8080/](http://localhost:8080/) and change `test` to `bizzby` inside the DSN popup

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