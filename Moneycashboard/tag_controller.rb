require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ('./models/tag')


get '/tag/new' do
  @tags = Tag.all
  erb ( :'tags/new' )
end

get '/tag' do
  @tags = Tag.all()
  erb ( :'tags/index' )
end

post '/tag' do
  @tag = Tag.new(params)
  @tag.save()
  erb ( :'tags/create' )
end

get '/tag/:id' do 
  @tag = Tag.find(params[:id])
  @tag.transactions()
  erb ( :'tags/show' )
end

get'/tag/:id/transactions' do
  @tag = Tag.find(params[:id])
  @transactions = @tag.transactions
  options = @transactions.to_a
  @total = @tag.total(options)
  erb (:'tags/transactions/show')

end

post'/tag/:id' do 
  @tag = Tag.update(params)
  redirect to("/tag/#{params[:id]}")

end

# post '/tag/:id/delete' do
#   Tag.delete( params[:id])
#   redirect to('/tag')
# end

# get'/tag/:id/edit' do
#   @tag = Tag.find(params[:id])
#   erb (:'tags/edit')

# end