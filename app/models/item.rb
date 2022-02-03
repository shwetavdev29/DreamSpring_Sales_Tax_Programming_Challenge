class Item < ApplicationRecord
  belongs_to :bill

  def import?
    description.downcase.include? 'import'
  end

  def taxable?(subcategories)
    (subcategories & description.split(' ')).blank?
  end

  def total_price
    quantity * price
  end

  def import_tax
    (total_price * 5) / 100
  end

  def other_tax
    (total_price * 10) / 100
  end
end
