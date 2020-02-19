class PoemsController < ApplicationController

    get '/poems' do
        @poems = Poem.all 

        erb :"/poems/index"
    end

end