require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

  get '/' do  
    erb :super_hero
  end
  post '/teams' do 
      
    @team = Team.new(params[:team])
    # @team = params[:team]
    params[:team][:members].each { |x| Superhero.new(x)}
    @hero = Superhero.all
    
    erb :team
  
  end
  
end
