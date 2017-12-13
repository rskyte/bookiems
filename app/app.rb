require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :index
  end

  get '/links/new' do
    erb :add_link
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to('/links')
  end

  get '/tag/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :tag_filter
  end

  run! if app_file == $0
end
