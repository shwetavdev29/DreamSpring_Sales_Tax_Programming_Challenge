# frozen_string_literal: true

require 'money'
require 'money/bank/fixer_currency'

module BillsHelper
  def convert(amount, to = 'USD')
    money = Money.new(amount, 'EUR')
    money.exchange_to(to.to_sym).to_f
  end
end
