require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do 
        erb :super_hero
    end

    post "/teams" do
        everything = params[:team][:members]
        everything.each do |hero|
            
            @hero = Hero.new(hero)
            # @hero.name = hero["name"]
            # @hero.power = hero["power"]
            # @hero.biography = hero["biography"]
        end
        
        @heroes = Hero.all
        erb :team
    end


end
