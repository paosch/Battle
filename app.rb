require 'sinatra/base'

class Battle < Sinatra::Base
  # "Testing infrastructure working!"
  enable :sessions
  get '/' do
    erb :index
  end

  post '/names' do # index file sends us to this route
    # in order to pass the variables into the view(=erb file),
    # we extract them from the params in the post '/names' action
    #@player_1_name = params[:player_1_name] # make whatever the player enters equal to player_1_name
    #@player_2_name = params[:player_2_name]
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end
  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :play
  end
  get '/attack' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :attack
  end
  # to link the result of the get '/play' route with the last route: use a link in play.erb
  
  run! if app_file == $0
end

# Sinatra's modulus style set up
