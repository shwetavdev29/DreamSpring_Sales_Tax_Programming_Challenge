# frozen_string_literal: true

Money::Bank::FixerCurrency.ttl_in_seconds = 86_400
Money.default_bank = Money::Bank::FixerCurrency.new(ENV["fixer_api_key"])
