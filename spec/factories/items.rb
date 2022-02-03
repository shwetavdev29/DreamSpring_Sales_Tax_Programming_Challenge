FactoryBot.define do
  factory :item do
    bill { nil }
    quantity { 1 }
    price { 1.5 }
    decription { "MyString" }
  end
end
