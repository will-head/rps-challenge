require 'sinatra/base'
require_relative 'lib/player'

# Global for testing, refactor to use group :test from Gemfile?
# $verbose = true
# NUMBER_OF_PLAYERS = 1

class RockPaperScissorsWebGame < Sinatra::Base
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

  get '/' do
    verbose_output(request.url) if $verbose

    session[:players] = Array.new

    erb :index
  end
  
  post '/names' do
    verbose_output(request.url) if $verbose

    if params[:commit] == "Play Human"
      session[:players].push(Player.new(params[:player_0_name]))
      redirect to('/add_player')
    elsif params[:commit] == "Play"
      session[:players].push(Player.new(params[:player_1_name]))
    else
      session[:players].push(Player.new(params[:player_0_name]))
      session[:players].push(Player.new("Computer"))
    end

    redirect to('/play')
  end

  get '/add_player' do
    verbose_output(request.url) if $verbose

    erb :add_player
  end
  
  get '/play' do
    verbose_output(request.url) if $verbose

    @current_player = session[:players][0]

    p @current_player.move

    if @current_player.move
      @current_player = session[:players][1]
    end

    erb :play
  end

  post '/move' do
    verbose_output(request.url) if $verbose

    unless session[:players][0].move
      session[:players][0].move = params[:commit]
    end
    
    session[:players][1].move = ['🗿', '📄', '✂'].sample

    redirect to('result')
  end

  get '/result' do
    verbose_output(request.url) if $verbose
 
    erb :result
  end
  # start the server if ruby file executed directly
  run! if app_file == $0

  private

  def verbose_output(where)
    puts "\n#{where}"
    puts "session: "; p session
    puts "params: "; p params
  end

end
