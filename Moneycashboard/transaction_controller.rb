require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ('./models/transaction')
require_relative ('./models/account')
require_relative ('./models/merchant')
require_relative ('./models/tag')


get '/transaction/new' do
  @accounts = Account.all
  @tags = Tag.all
  @merchants = Merchant.all
  erb ( :'transactions/new' )
end

get '/transaction' do
  @transactions = Transaction.all_pretty()
  options = @transactions.to_a
  @total = Transaction.total
  erb ( :'transactions/index' )
end

post '/transaction' do
  @transaction = Transaction.new(params)
  @account = Account.find(@transaction.account_id)
  @account.balance -= @transaction.amount
  @transaction.save()
  @account.update()
  erb ( :'transactions/create' )
end

get '/transaction/:id' do 
  @transaction = Transaction.find(params[:id])
  erb ( :'transactions/show' )
end

get'/transaction/:id/edit' do
  @transaction = Transaction.find(params[:id])
  erb (:'transactions/edit')
end

post'/transaction/:id' do 
  @transaction = Account.update(params)
  binding.pry
  redirect to("/transaction/#{params[:id]}")
end

get '/transaction/:id/delete' do
  @transaction = Transaction.find(params[:id])
  @account = Account.find(@transaction.account_id)
  @account.balance = @account.balance += @transaction.amount.to_f
  @account.update
  Transaction.delete( params[:id])
  redirect to('/transaction')
end
