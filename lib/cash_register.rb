#cash register class
class CashRegister
    #attribute accessors
    attr_accessor :total, :discount, :items

    #initialize
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_trans = {"lname" => "", "lprice" => 0, "lquantity" => 0}
    end

    #keep record of last transaction
    def record_trans(name, price, quantity)
        @last_trans[:lname] = name
        @last_trans[:lprice] = price
        @last_trans[:lquantity] = quantity
    end

    #add item to total
    def add_item(name, price, quantity = 1)
        self.total += price * quantity
        quantity.times {self.items << name}
        record_trans(name, price, quantity)
    end

    #void last transaction
    def void_last_transaction
        self.total -= @last_trans[:lprice] * @last_trans[:lquantity]
        @last_trans[:lquantity].times {self.items.delete(:lname)}
    end

    #apply employee discount to total
    def apply_discount
        self.total -= (self.discount * 0.01) * self.total
        return self.total > 0 ? "After the discount, the total comes to $#{self.total.to_i}." : "There is no discount to apply."
    end



end