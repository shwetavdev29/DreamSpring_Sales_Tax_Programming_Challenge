# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :bill

  before_save :set_price

  def import?
    description.downcase.include? 'imported'
  end

  def taxable?(subcategories)
    (subcategories & description.split(' ')).blank?
  end

  def total_price
    (quantity * price) * 100
  end

  def import_tax
    (total_price * 5) / 100
  end

  def other_tax
    (total_price * 10) / 100
  end

  private

  def set_price
    self.price =  price * 100
  end
end
