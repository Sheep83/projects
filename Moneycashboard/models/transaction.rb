require('pg')
require_relative('../db/sql_runner')

class Transaction

  attr_reader( :id, :account_id, :merchant_id, :tag_id, :amount, :trans_date, :description, :type )

  def initialize( options )
    @id = options['id'].to_i
    @account_id = options['account_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount = options['amount'].to_f
    # @trans_date = options['trans_date']
    # @description = options['description'].to_s
    # @type = options['type'].to_s
  end

  def self.all
    sql = "SELECT * FROM transactions"
    transactions = run_sql(sql) 
    result = transactions.map { |transaction| Transaction.new(transaction)}
    return result  
  end

  def self.all_pretty
    sql = "SELECT transactions.id, accounts.type, transactions.amount, merchants.name FROM accounts INNER JOIN transactions ON accounts.id = transactions.account_id INNER JOIN merchants ON transactions.merchant_id = merchants.id WHERE merchants.id = transactions.merchant_id"
    @transactions = run_sql(sql)
    # binding.pry
    return @transactions
    nil
  end

  def self.by_account(id)
    sql = "SELECT * FROM transactions WHERE account_id=#{id}"
    transactions = run_sql(sql) 
    result = transactions.map { |transaction| Transaction.new(transaction)}
    return result  
  end

  def self.by_tag(id)
    sql = "SELECT * FROM transactions WHERE tag_id=#{id}"
    transactions = run_sql(sql) 
    result = transactions.map { |transaction| Transaction.new(transaction)}
    return result  
  end

  def self.by_merchant(id)
    sql = "SELECT * FROM transactions WHERE merchant_id=#{id}"
    transactions = run_sql(sql) 
    result = transactions.map { |transaction| Transaction.new(transaction)}
    return result  
  end

  def self.total()
    @total = 0
    sql = "SELECT * FROM transactions"
    transactions = run_sql(sql)
    # binding.pry
    transactions.each do |transaction|
      @total += transaction['amount'].to_f
    end
    return @total.to_f
  end

  def save()
    sql = "INSERT INTO transactions (account_id, merchant_id, tag_id, amount) VALUES (#{@account_id}, #{@merchant_id}, #{@tag_id}, #{@amount}) RETURNING *"
    trans_data = run_sql(sql)
    @id = trans_data.first['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id=#{id}"
    transaction = run_sql(sql)
    result = Transaction.new(transaction.first)
    return result
  end

  def self.delete( id )
    sql = "DELETE FROM transactions WHERE id=#{id}"
    run_sql(sql)
  end

  def summary()
    sql = "SELECT transactions.trans_date, merchants.name, transactions.amount, transactions.type FROM merchants INNER JOIN transactions ON transactions.merchant_id = merchants.id WHERE transactions.id = #{@id}"
    results = run_sql(sql).first  
    return results
  end

end

# def self.update(options)
#   sql = "UPDATE transactions SET 
#         merchant_id ='#{options['merchant_id']}',
#         tag_id ='#{options['tag_id']}',
#         amount ='#{options['amount']}',
#         trans_date = '#{options['trans_date']}',
#         description = '#{options['description']}',
#         type = #{options['type']}
#         WHERE id = '#{options['id']}';"
#   run_sql(sql)
# end











