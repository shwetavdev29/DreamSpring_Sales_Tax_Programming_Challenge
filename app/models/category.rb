# frozen_string_literal: true

class Category < ApplicationRecord
  def self.subcategories
    all.map(&:items).flatten
  end
end
