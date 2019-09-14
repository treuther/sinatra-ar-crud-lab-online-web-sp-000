
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

#---------- CREATE ----------#
  get '/articles/new' do

    erb :new
  end

  get '/articles' do
    @article = Article.new(title: params[:title], content: params[:content])
    @article.save
    @articles = Article.all

    erb :index
  end

#---------- READ ----------#
  get '/articles' do

  end
end
