require 'pry'
class CashRegister

    attr_accessor :discount, :total, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction = quantity * price
        self.total += self.last_transaction
        quantity.times{ self.items << title }
    end

    def apply_discount
        if self.discount > 0
            self.total = self.total - (self.total * self.discount / 100)
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end