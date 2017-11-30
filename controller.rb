require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('controllers/stores_controller.rb')
require_relative('controllers/tags_controller.rb')
require_relative('controllers/transactions_controller.rb')


@@BUDGET = 1000

get '/' do
  redirect to "/transactions"
end
