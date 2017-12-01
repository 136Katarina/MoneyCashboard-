require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/store.rb')

@@BUDGET = 1000


get '/transactions' do
  @transactions = Transaction.all
  @total = Transaction.total()
  @total = @total/100.to_f
  erb(:'transactions/index')
end

 get '/transactions/search' do
   @transactions = Transaction.find_by_date(params[:transaction_date])
   @date = params[:transaction_date]
   erb(:'transactions/search')
end

get '/transactions/new' do
  @tags = Tag.all
  @stores = Store.all
  erb(:'transactions/new')
end

post '/transactions' do
  params[:amount] = params[:amount].to_f * 100
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to "/transactions"
end



get '/transactions/:id' do
  @transaction = Transaction.find( params['id'] )
  erb(:'transactions/show')
end



get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'])
  @stores = Store.all
  @tags= Tag.all
  erb(:'transactions/edit')
end


put '/transactions/:id' do
  params[:amount] = params[:amount].to_f * 100
  transaction = Transaction.new(params)
  transaction.update
  redirect to '/transactions'
end



delete '/transactions/:id' do
  transaction = Transaction.find( params[:id])
  transaction.delete
  redirect to '/transactions'
end
