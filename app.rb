require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

before do
  if Count.all.size == 0
    Count.create(number: 0)
  end
end

get '/' do
  redirect '/count'
end

post '/addcount' do
  Count.create(number: 0)
  @numbers = Count.all
  redirect '/count'
end

get '/count' do
  @numbers = Count.all.order(id: :desc)
  erb :index
end

post '/plus/:id' do
  count = Count.find(params[:id])
  count.number = count.number + 1
  count.save
  redirect '/count'
end

post '/minus/:id' do
  count = Count.find(params[:id])
  count.number = count.number - 1
  count.save
  redirect '/count'
end

post '/clear/:id' do
  count = Count.find(params[:id])
  count.number = 0
  count.save
  redirect '/count'
end

post '/kakeru/:id' do
  count = Count.find(params[:id])
  count.number = count.number * 2
  count.save
  redirect '/count'
end

post '/waru/:id' do
  count = Count.find(params[:id])
  count.number = count.number / 2
  count.save
  redirect '/count'
end

post '/delete/:id' do
  Count.find(params[:id]).destroy
  redirect '/count'
end