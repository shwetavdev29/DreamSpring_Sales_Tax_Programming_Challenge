# frozen_string_literal: true

FactoryBot.define do
  factory :bill do
    total { 1.5 }
    total_tax { 1.5 }
  end
end
