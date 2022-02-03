require 'money'
require 'money/bank/fixer_currency'

module BillsHelper
  def convert(amount, from = 'EUR', to = 'USD')
    money = Money.new(amount, from)
    money.exchange_to(to.to_sym).to_f
  end
end
