require 'sinatra/base'
require './app/models/link'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/add_link'
  end

  post '/links' do
    @title = params[:title]
    @url = params[:url]
  end
end
