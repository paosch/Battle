require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'
class Battle < Sinatra::Base
  # "Testing infrastructure working!"
  enable :sessions
  get '/' do
    erb :index # this erb file contains html stuff
  end

  post '/names' do
    # in order to pass the variables into the view(=erb file),
    # we extract them from the params in the post '/names' action
    #@player_1_name = params[:player_1_name] # make whatever the player enters equal to player_1_name
    #@player_2_name = params[:player_2_name]
    #session[:player_1_name] = params[:player_1_name]
    #session[:player_2_name] = params[:player_2_name]
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end
  get '/play' do
    #@player_1_name = session[:player_1_name]
    #@player_2_name = session[:player_2_name]
    @player_1 = $player_1
    @player_2 = $player_2
    erb :play
  end
  get '/attack' do
    #@player_1_name = session[:player_1_name]
    #@player_2_name = session[:player_2_name]
    #@player_1_name = $player_1.name
    #@player_2_name = $player_2.name
    @player_1 = $player_1
    @player_2 = $player_2
    Game.new.attack(@player_2) # running attack method on new instance of Game class
    erb :attack # takes us to attack.erb
  end
  # to link the result of the get '/play' route with the last route: use a link in play.erb

  run! if app_file == $0
end

# Sinatra's modulus style set up
