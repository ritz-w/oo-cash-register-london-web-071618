require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity=1)
    @total = @total + price*quantity
    quantity.times do
      @items << title
    end
    @last_item = price
  end

  def apply_discount
    if @discount != 0
      @discount = @discount * 0.01
      @total = @total - (@total * @discount).to_i
      return "After the discount, the total comes to $#{@total}."
    else return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total = @total - @last_item
  end

end
# 
# meimei = CashRegister.new(-12)
# meimei.add_item("grapes", 1, 2)
# meimei.add_item("sparkling water", 0.5, 3)
# meimei.add_item("fruit", 2, 5)
#
# binding.pry
