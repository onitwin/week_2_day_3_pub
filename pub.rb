class Pub

  attr_reader :name, :till, :stock
  attr_writer :till , :stock


  def initialize(name,till)
    @name=name
    @till=till
    @stock=[]
  end

#getters
  # def get_name
  #   return @name
  # end
  #
  # def get_till_balance
  #   return @till
  # end

  def add_stock(drink)
    @stock.push(drink)
  end

  def remove_stock()
    @stock.pop()
  end

  def add_to_till(drink)
    @till +=drink.price
  end

  def age_check(cust)
    if cust.age < 18
      return false
    else
      return true
    end
  end

  def drunkenness_check(cust)
    if cust.drunkenness > 45
      return false
    else
      return true
    end
  end







end
