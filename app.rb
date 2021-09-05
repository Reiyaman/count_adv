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

get '/count' do
  @number = Count.first.number
  Count.create!(number: "number2")
  @number2 = Count.second.number
  erb :index
end

post '/plus' do
  count = Count.first
  count.number = count.number + 1
  count.save
  redirect '/count'
end

post '/minus' do
  count = Count.first
  count.number = count.number - 1
  count.save
  redirect '/count'
end

post '/clear' do
  count = Count.first
  count.number = 0
  count.save
  redirect '/count'
end

post '/kakeru' do
  count = Count.first
  count.number = count.number * 2
  count.save
  redirect '/count'
end

post '/waru' do
  count = Count.first
  count.number = count.number / 2
  count.save
  redirect '/count'
end

post '/plus2' do
  count2 = Count.second
  count2.number = count2.number + 1
  count2.save
  redirect '/count'
end

post '/minus2' do
  count2 = Count.second
  count2.number = count2.number - 1
  count.save
  redirect '/count'
end

post '/clear2' do
  count2 = Count.second
  count2.number = 0
  count2.save
  redirect '/count'
end

post '/kakeru2' do
  count2 = Count.second
  count2.number = count2.number * 2
  count2.save
  redirect '/count'
end

post '/waru2' do
  count2 = Count.second
  count2.number = count2.number / 2
  count2.save
  redirect '/count'
end