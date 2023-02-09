class CashRegister
  attr_reader :discount, :total

  def initialize(discount = 0)
    @discount = discount
    @total = 0.0
    @items = []
     @transactions = []
  end

  def total=(amount)
    @total = amount
  end

  def add_item(title, price, quantity = 1)
    quantity.times { @items << title }
    transaction_amount = price * quantity
    @transactions << transaction_amount
    @total += transaction_amount
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total *= (1 - @discount.to_f / 100)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
   if @transactions.empty?
      @total = 0.0
    else
      @total -= @transactions.pop
    end
end
end
