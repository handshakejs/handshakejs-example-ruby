class Application < Sinatra::Base
  enable :raise_errors
  use Rack::Session::Cookie, :key => 'my_app_key',
                             :path => '/',
                             :expire_after => 14400, # In seconds
                             :secret => 'secret_stuff'
  
  get "/" do
    erb :index
  end

  get "/logout" do
    session[:user] = nil
    redirect "/dashboard"
  end

  post "/login/success" do
    session[:user] = params[:email] 
    redirect "/dashboard"
  end

  get "/dashboard" do
    return redirect "/" if !session[:user]
    erb :dashboard
  end

  get "/session" do
    session[:user]
  end
end
