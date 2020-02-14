require './config/environment'

class ApplicationController < Sinatra::Base
  # configure :public_folder, :views, and enable(and set) secret sessions "tea" cause I like to drink tea and read poetry!
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "tea"
  end

  # get methods below:
  
  get "/" do
    erb :welcome
  end



    #helper methods below:
    
    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
end
