class CashRegister
    
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        
        # if quantity > 1
        #     i = 0
        #     while i < quantity 
        #         @items << title
        #         i += 1
        #     end
        # else
        #     @items << title
        # end

        quantity.times do 
            @items << title
        end
        @last_transaction = price * quantity
        @total += price * quantity

    end

    def apply_discount
        if @discount > 0
            @discount = @discount / 100.0
            @total = @total - (@total * @discount)
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @last_transaction
    end

end
