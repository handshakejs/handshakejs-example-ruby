RACK_ENV                  = ENV['RACK_ENV']

case RACK_ENV
when "production"
when "test"
else  
  # defined above 
  SALT = ENV['SALT']
end
