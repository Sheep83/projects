require('pg')
require_relative('../db/sql_runner')

class Account

  attr_reader( :id, :user_name, :balance, :type)
  attr_accessor( :balance )

  def initialize( options )
    @id = options['id'].to_i
    @type = options['type']
    @balance = options['balance'].to_f
  end

  def save()
    sql = "INSERT INTO accounts (type, balance) VALUES ('#{@type}', '#{@balance}') RETURNING *"
    acc_data = run_sql(sql)
    @id = acc_data.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM accounts"
    accounts = run_sql(sql) 
    result = accounts.map { |account| Account.new(account)}
    return result  
  end

  def self.find(id)
    sql = "SELECT * FROM accounts WHERE id=#{id}"
    account = run_sql(sql)
    result = Account.new(account.first)
    return result
  end

  def self.update(options)
    sql = "UPDATE accounts SET 
    type='#{options['type']}',
    balance='#{options['balance']}'
    WHERE id = '#{options['id']}'"
    run_sql(sql)
  end

  def self.delete( id )
    sql = "DELETE FROM accounts WHERE id=#{id}"
    run_sql(sql)
  end

  def transactions
    sql = "SELECT transactions.id, accounts.type, transactions.amount, merchants.name FROM merchants INNER JOIN transactions ON merchants.id = transactions.merchant_id INNER JOIN accounts ON transactions.account_id = accounts.id WHERE accounts.id = #{@id}"
    result = run_sql(sql)
    return result
  end

  def update()
    sql = "UPDATE accounts SET 
    type='#{@type}',
    balance='#{@balance}'
    WHERE id = '#{@id}'"
    run_sql(sql)
  end

  def total(options)
    total = 0
    options.each do |transaction|
      total += transaction['amount'].to_f
    end
    return total
  end

end
