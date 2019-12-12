require 'pry'
class CashRegister
attr_accessor :total, :items, :discount, :scanTotal

def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
end
    
def add_item(name, price, quantity = 1)
      self.total += price * quantity
      quantity.times do 
        self.items << name
      end
      self.scanTotal = price * quantity
end 
  
def apply_discount
if self.discount != 0 
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
else
      "There is no discount to apply."
end
end

def items
  @items
end


def void_last_transaction
  self.total = self.total - self.scanTotal
end 

end #end of class CashRegister