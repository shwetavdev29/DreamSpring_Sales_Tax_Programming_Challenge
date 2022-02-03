# frozen_string_literal: true

params = [
  { name: 'Food', items: %w[chocolate chips fruit vegetable drink] },
  { name: 'Book', items: %w[fiction non-fiction educational story book novel biography] },
  { name: 'Medicine', items: %w[Liquid Capsules Suppositories Tablet Drops Inhalers Injections Implants patches pills] }
]

Category.create(params)
