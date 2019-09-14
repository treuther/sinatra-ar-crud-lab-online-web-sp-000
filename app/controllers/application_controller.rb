
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all

    erb :index
  end

#---------- CREATE ----------#
  get '/articles/new' do

    erb :new
  end

  post '/articles' do
    @article = Article.new(title: params[:title], content: params[:content])
    @article.save
    @articles = Article.all

    erb :index
  end

#---------- READ ----------#
  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

#---------- UPDATE ----------#
  get '/articles/:id/edit' do

    erb :edit
  end

#---------- DELETE ----------#
  delete '/articles/:id/delete' do
    @article = Article.find_by_id(params[:id])
    @article.delete

    erb :delete
  end
end
