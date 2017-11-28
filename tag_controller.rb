require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('./models/transaction.rb')
require_relative('./models/tag.rb')
require_relative('./models/store.rb')


get '/category' do
  @tag = Tag.all
  erb(:category)
end

get 'category/:id' do
  @tag = Tag.all
  @transaction = Transaction.find_tag_category(params[:id])
  erb(:food_table)
end
