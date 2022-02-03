# frozen_string_literal: true

class Bill < ApplicationRecord
  has_many :items

  accepts_nested_attributes_for :items, reject_if: :all_blank, reject_if: proc {|a| a['price'].blank? || a['quantity'].blank? || a['description'].blank?}

  before_validation :calculate_totals

  validates :total, presence: true, numericality: { greater_than: 0 }

  private

  def calculate_totals
    @subcategories = Category.subcategories
    tax = 0
    items.map do |item|
      tax += item.other_tax if item.taxable?(@subcategories)
      tax += item.import_tax if item.import?
    end
    self.total_tax = tax
    self.total = items.map(&:total_price).sum
  end
end
