require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/store.rb')


get '/stores' do
  @stores = Store.all
  erb(:'stores/index')
end

get '/stores/new' do
  @stores = Store.all
  erb(:'stores/new')
end

post '/stores' do
  @store = Store.new(params)
  @store.save()
  redirect to '/stores'
end
