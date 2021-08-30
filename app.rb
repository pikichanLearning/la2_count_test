require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
  end
end

get '/' do
  @number = Count.first
  erb :index
end

post '/plus' do
  Count.number = Count.number + 1
  @number = Count.first
  redirect '/'
end  