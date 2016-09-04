require( 'minitest/autorun' )
require_relative( '../models/merchant' )

class TestMerch < MiniTest::Test

  def setup
      options = {
        'name' => 'amazon'
      }
      @merchant = Merchant.new( options )
  end

  def test_name()
    assert_equal( 'amazon', @merchant.name() )
  end

end