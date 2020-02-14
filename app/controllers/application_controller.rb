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

  get '/user/:id' do
    @user = Users.find_by(params[:id])
    erb :"/users/show"
  end

  get '/session/login' do
    erb :"sessions/login"
  end

  post '/sessons' do
    @user = Users.find_by(username: params[:username], password: [:password])

    if @user
      session[:user_id] = @user.id
      redirect to '/user/:id'
    end
    redirect '/user/home'
  end

  get '/user/home' do
    @user = User.find(session[:user_id])
    erb :'/users/home'
  end

    #helper methods below:
    
    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
end
