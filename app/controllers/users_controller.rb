require 'pry'

class UsersController < ApplicationController

    #index actions:
    get '/users' do
        @users = User.all 

        erb :"/users/index"
    end

    #new user action
    get '/users/new' do 
        erb :"/users/new"
    end

    #create users action:
    post '/signup' do
        user = User.new(params["user"])

        if user.save
            session[:user_id] = user.id 
            redirect to "/users/id"
        else
            @errors = user.errors.full_messages
            erb :"/users/new"
        end
    end

    # #create login
    # get '/login' do
    #     erb :"users/login"
    # end

    #show users actions
    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :"/users/show"
    end

    post '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :"/users/show"
    end

    #edit users actions
    get '/users/:id/edit' do
        @user = User.find_by_id(params[:id])
        if @user == current_user
            erb :"/users/edit"
        else
            redirect '/'
        end
    end

    #user update action
    patch '/users/:id' do
        @user = User.find_by_id(params[:id])
        @user.id = params[:id]
        @user.name = params[:name]
        @user.age = params[:age]
        if @user.update(params[:user])
            redirect to "/users/:id"
            
        else
            erb :"users/edit"
        end
    end

     #user delete action
     delete '/user/:id' do
        @user = User.find_by_id(params[:id])
        if @user
            @user.destroy
        else
            redirect to "/"
        end
     end

    #helper method
    def login
        User.find_by(id: session[:user_id])
    end

end