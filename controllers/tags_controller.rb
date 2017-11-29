require('sinatra')
require('sinatra/reloader')
require('pry-byebug')

require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/store.rb')


get '/tags' do
  @tags = Tag.all
  erb(:'tags/index')
end

get '/tags/:id' do
  @tags = Tag.all
  @tag = Tag.find(params[:id])
  @transactions = Transaction.tag_type(params[:id])
  @sum = Transaction.total_by_tag_category(params[:id])
  erb(:'tags/show')
end
