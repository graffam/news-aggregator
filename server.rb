require 'sinatra'
require 'pry'
require 'CSV'

get '/' do
  @csv = CSV.read('articles.csv')
  erb :index
end


get '/articles/new' do
  erb :new
end

post '/articles' do

  @article ="#{params['article_title']},#{params['URL']},#{params['description']}\n"
  File.open('articles.csv', "a") do |f|
    f.write(@article)
  end
  redirect '/'
end
