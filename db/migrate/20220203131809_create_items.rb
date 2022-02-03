# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :bill, null: false, foreign_key: true
      t.integer :quantity
      t.float :price
      t.string :description

      t.timestamps
    end
  end
end
