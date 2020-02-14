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
  # need get for main page, sign up, login, loggout = redirect to main page, edit, post, ect.
  get "/" do
    erb :welcome
  end



    #helper methods below:
    #need  helper methods: logged in, current_user, ect.
    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
end
