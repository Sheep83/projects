require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ('./models/merchant')

get '/merchant/new' do
  erb ( :'merchants/new' )
end

post '/merchant' do
  @merchant = Merchant.new(params)
  @merchant.save()
  erb ( :'merchants/create' )

end

get '/merchant' do
  @merchants = Merchant.all()
  erb ( :'merchants/index' )
end

get '/merchant/:id' do 
  @merchant = Merchant.find(params[:id])
  erb ( :'merchants/show' )
end

post'/merchant/:id' do 
  @merchant = Merchant.update(params)
  redirect to("/merchant/#{params[:id]}")

end

get'/merchant/:id/transactions' do
  @merchant = Merchant.find(params[:id])
  @transactions = @merchant.transactions
  options = @transactions.to_a
  @total = @merchant.total(options)
  erb (:'merchants/transactions/show')

end

# post '/merchant/:id/delete' do
#   Merchant.delete( params[:id])
#   redirect to('/merchant')
# end

# get'/merchant/:id/edit' do
#   @merchant = Merchant.find(params[:id])
#   erb (:'merchants/edit')

# end





