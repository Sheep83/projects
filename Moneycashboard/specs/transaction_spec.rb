require( 'minitest/autorun' )
require_relative( '../models/transaction' )

class TestTrans < MiniTest::Test

  def setup
      options = {
        'merchant_id' => '1', 
        'tag_id' => '1', 
        'amount' => '25', 
        'trans_date' => '2016-07-02',
        'description' => 'food and stuff',
        'type' => 'cash'
      }
      @transaction = Transaction.new( options )
  end

  def test_amount()
    assert_equal( 25, @transaction.amount() )
  end

  def test_trans_date()
    assert_equal( '2016-07-02', @transaction.trans_date() )
  end

  def test_description()
      assert_equal( 'food and stuff', @transaction.description() )
  end

  def test_type()
      assert_equal( 'cash', @transaction.type() )
  end


end