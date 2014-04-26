class Application < Sinatra::Base
  enable :raise_errors
  use Rack::Session::Cookie, :key => 'my_app_key',
                             :path => '/',
                             :expire_after => 14400, # In seconds
                             :secret => 'secret_stuff. you should change this value.'
  
  get "/" do
    @app_name = ENV['APP_NAME']
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
    Handshakejs.salt = ENV['SALT']
    result = Handshakejs.validate({email: params[:email], hash: params[:hash]})

    session[:user] = params[:email] if result

    redirect "/dashboard"
  end
end
