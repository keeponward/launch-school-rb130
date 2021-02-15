require_relative 'cash_register'
require_relative 'transaction'

cash = CashRegister.new(100)
item_cost = 16
trans = Transaction.new(item_cost)

cash.start_transaction(trans)

puts cash.total_money

