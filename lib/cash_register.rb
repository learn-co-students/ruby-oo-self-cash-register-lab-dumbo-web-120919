class CashRegister

    attr_accessor :total, :discount, :items, :last_item

    def initialize(employee_discount=nil)
        @total = 0
        @discount = employee_discount
    end 

    def add_item(title, price, quantity=1)
        @total += (price * quantity)
        @items ||= []
        quantity.times { @items << title }
        @last_item = price * quantity
    end

    def apply_discount
        if @discount
            @total = ((100 - @discount) * 0.01) * @total
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total = @total - @last_item
    end

end
