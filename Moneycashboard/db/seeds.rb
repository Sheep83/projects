require('pg')
require('pry-byebug')
require_relative('sql_runner')
require_relative('../models/account')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

account1_init = {
  'type' => 'Current Account',
  'balance' => 94.26
}
account2_init = {
  'type' => 'Savings Account',
  'balance' => 1000,
}
merchant1_init = {
  'name' => 'Amazon'
} 
merchant2_init = {
  'name' => 'eBay'
}
tag1_init = {
  'name' => 'Entertainment'
}
tag2_init = {
  'name' => 'Vintage Star Wars'
}
transaction1_init = {
  'account_id' => 1,
  'merchant_id' => 1,
  'tag_id' => 1,
  'amount' => 25.26,
  # 'trans_date' => "'2016-07-01'"
  # 'description' => "'blah1'",
  # 'type' => "'cash'"
}
transaction2_init = {
  'account_id' => 1,
  'merchant_id' => 2,
  'tag_id' => 1,
  'amount' => 50.15,
  # 'trans_date' => "'2016-07-02'"
  # 'description' => "'blah2'",
  # 'type' => "'debit'"
}
transaction3_init = {
  'account_id' => 1,
  'merchant_id' => 1,
  'tag_id' => 2,
  'amount' => 75.56,
  # 'trans_date' => "'2016-06-30'"
  # 'description' => "'blah3'",
  # 'type' => 'cash'
}
transaction4_init = {
  'account_id' => 2,
  'merchant_id' => 1,
  'tag_id' => 2,
  'amount' => 100.99,
  # 'trans_date' => "'2016-07-02'"
  # 'description' => "'blah4'",
  # 'type' => 'debit'
}
trans_update = {
  'id' => '1',
  'amount' => '500'
}

balance_update = {
  'id' => 1,
  'amount' => '500'
}


account1 = Account.new( account1_init )
account2 = Account.new( account2_init )
account1.save
account2.save
merchant1 = Merchant.new( merchant1_init )
merchant2 = Merchant.new( merchant2_init )
merchant1.save
merchant2.save
tag1 = Tag.new( tag1_init )
tag2 = Tag.new( tag2_init )
tag1.save
tag2.save
trans1 = Transaction.new( transaction1_init )
trans2 = Transaction.new( transaction2_init )
trans3 = Transaction.new( transaction3_init )
trans4 = Transaction.new( transaction4_init )
trans1.save
trans2.save
trans3.save
trans4.save







