class UserController < ApplicationController

    #index actions:
    get '/users' do
        @users = Users.all 

        erb :"/users/index"
    end

    #new user action
    get '/signup' do 
        erb :users/new
    end

    #create users action:


    #show users actions


    #edit users actions

end