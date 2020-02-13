require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "tea"
  end

  get "/" do
    erb :welcome
  end

  get '/user/:id' do
    
    erb :user_id
  end
end
