require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drinks')
require_relative('../pub')





class CustomerTest < MiniTest::Test

  def setup
    @cust1=Customer.new("Sol",80,38)
    @cust2=Customer.new('Moon',500,12)
    @drink7=Beverage.new('Gin',7,13)
    @drink9=Beverage.new("Pepsi",3,0)
    @pub=Pub.new("Ravenloft",200)
  end

  def test_get_name
    assert_equal("Sol",@cust1.name)
  end

  def test_get_wallet
    assert_equal(80,@cust1.wallet)
  end

  def test_get_age
    assert_equal(38,@cust1.age)
  end

  def test_get_drunk
    assert_equal(0,@cust1.drunkenness)
  end

  def test_buy_drink_wallet
    @cust1.buy_drink(@drink7)
    assert_equal(73,@cust1.wallet)
  end

  def test_buy_drink_alchohol
    @cust1.buy_drink(@drink7)
    assert_equal(13,@cust1.drunkenness)
  end

  def test_buy_drink_alchohol_free
    @cust1.buy_drink(@drink9)
    assert_equal(0,@cust1.drunkenness)
  end

  def test_integrated_buy_old_enough
    @pub.add_stock(@drink7)
    @pub.add_stock(@drink7)
    @pub.add_stock(@drink7)
    #assert_equal(3,@pub.stock.length)#check stock added
    @cust1.purchase(@pub,@drink7,@cust1)#cust buys drink
    assert_equal(73,@cust1.wallet)#cust wallet decreases
    assert_equal(13,@cust1.drunkenness)#cust drunkeness increases
    assert_equal(207,@pub.till)#pub till value increases
  end

  def test_integrated_buy_not_old_enough
    @pub.add_stock(@drink7)
    @pub.add_stock(@drink7)
    @pub.add_stock(@drink7)
    #assert_equal(3,@pub.stock.length)#check stock added
    @cust1.purchase(@pub,@drink7,@cust2)#cust buys drink
    assert_equal(80,@cust1.wallet)#cust wallet decreases
    assert_equal(0,@cust1.drunkenness)#cust drunkeness increases
    assert_equal(200,@pub.till)#pub till value increases
  end





















end
