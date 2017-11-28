require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/store.rb')


get '/stores' do
  erb(:'stores/index')
end
