require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('./models/transaction.rb')
require_relative('./models/tag.rb')
require_relative('./models/store.rb')




get '/transactions' do
  @transactions = Transaction.all
  @total = Transaction.total()
    erb(:index)
end

get '/transactions/new' do
  @tags = Tag.all
  @stores = Store.all
  erb(:new)
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to "/transactions"
end



get '/transactions/:id' do
  @transaction = Transaction.find( params['id'] )
  erb(:show)
end



get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'])
  @stores = Store.all
  @tags= Tag.all
  erb(:edit)
end


put '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to '/transactions'
end



delete '/transactions/:id' do
  transaction = Transaction.find( params[:id])
  transaction.delete
  redirect to '/transactions'
end


get '/category' do
  @tag = Tag.all
  erb(:category)
end
