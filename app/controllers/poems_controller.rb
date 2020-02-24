class PoemsController < ApplicationController

    get '/poems' do
        @poems = Poem.all 

        erb :"/poems/index"
    end
    
    get '/poems/new' do
      erb :"/poems/new"
    end
    
    post '/poems' do
      @poem = Poem.create(:title => params[:title], :content => params[:content])
      redirect to "/poems/#{@poem.id}"
    end
    
    get '/poems/:id' do
      @poem = Poem.find_by_id(params[:id])
      erb :"/poems/show"
    end
    
    get '/poems/:id/edit' do
      @poem = Poem.find_by_id(params[:id])
      @poem.title = params[:title]
      @poem.content = params[:content]
      @poem.save
      redirect to "/poems/#{@poem.id}"
    end
    
    patch '/poems/:id' do
      
    end
    
    put '/poems/:id' do
      
    end
    
    delete '/poems/:id' do 
      
    end

end