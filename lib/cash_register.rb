class CashRegister

    attr_accessor :total
    attr_reader :items, :discount   

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_item_price = 0
    end

    def add_item(title, price, quantity = 1) 
        quantity.times do 
            @items << title 
        end

        @last_item_price = price * quantity

        @total += price * quantity 
    end 

    def apply_discount
        if @discount > 0
            @total = @total * (100 - @discount)/100
            return "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @last_item_price
    end

end 
