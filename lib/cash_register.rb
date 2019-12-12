class CashRegister
 
    attr_accessor :total, :discount
    attr_writer :items
   

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = {}
    end 

    def add_item(title, price, quantity=1)
        if !@items[title]
            @items[title] = {}
        end

        @items[title][:item] = []
        if quantity == 1
            @items[title][:item] << title
            @items[title][:price] = price
        else
            @items[title][:item] = []
            @items[title][:price] = price * quantity
            quantity.times {@items[title][:item] << title}
        end
        self.total  += (price * quantity)

    end

    def apply_discount
        if self.discount == 0 
            return "There is no discount to apply."
        end
        self.total -= (@total * (@discount * 0.01))
        "After the discount, the total comes to $#{self.total.round()}."
    end

    def find_item_price (title)
        @items[title][:price]
    end


    def items
        @items.map {|title, item| item[:item]}.flatten
    end

    def void_last_transaction
        last_item = self.items.last
        puts "ASKDJF
        AKLSDJFASKDJFALKSDJFALKSDJFALKSDJF"
        if last_item && find_item_price(last_item)
            if @total - find_item_price(last_item) < 0.0
                return @total = 0.0
            end
            return @total -= find_item_price(last_item)
        end
        0.0
        
    end

end

cashreg = CashRegister.new


