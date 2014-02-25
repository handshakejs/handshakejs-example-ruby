# handshakejs-example-ruby 

Example of using [handshakejs-script](https://github.com/handshakejs/handshakejs-script) with a ruby Sinatra app.

You can view it in action [here](http://handshake-example-ruby.herokuapp.com/).

## Usage

```bash
git clone https://github.com/handshakejs/handshakejs-example-ruby.git
cd handshakejs-example-ruby
echo "SALT=ddb5cf1ae20b5bb1a176dbb634f2031644f6365cf95accc637dd455acb9bbafb" > .env
bundle
bundle exec foreman start
```

Visit [http://localhost:5000](http://localhost:5000) in your browser.

## Deploying to Heroku

```bash
git clone https://github.com/handshakejs/handshakejs-example-ruby.git
cd handshakejs-example-ruby
heroku create
heroku config:set SALT=ddb5cf1ae20b5bb1a176dbb634f2031644f6365cf95accc637dd455acb9bbafb
git push heroku master
```
