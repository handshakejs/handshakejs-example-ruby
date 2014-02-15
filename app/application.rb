class Application < Sinatra::Base
  enable :raise_errors
  use Rack::Session::Cookie, :key => 'my_app_key',
                             :path => '/',
                             :expire_after => 14400, # In seconds
                             :secret => 'secret_stuff. you should change this value.'
  
  get "/" do
    erb :index
  end

  get "/logout" do
    session[:user] = nil
    redirect "/dashboard"
  end

  get "/dashboard" do
    return redirect "/" if !session[:user]
    erb :dashboard
  end

  post "/login/success" do
    email   = params[:email]
    salt    = SALT

    pbkdf2  = PBKDF2.new(:password=>email, :salt=>salt, :iterations=>1000, :key_length => 16, :hash_function => "sha1")

    session[:user] = params[:email] if pbkdf2.hex_string == params[:hash]
    redirect "/dashboard"
  end
end
