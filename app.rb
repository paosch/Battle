require 'sinatra/base'

class Battle < Sinatra::Base
  get "/" do
    "Hello Battle!"
  end
  run! if app_file == $0
end

# Sinatra's modulus style set up
