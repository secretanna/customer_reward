# frozen_string_literal: true

require_relative '../models/customer_purchase'

class Cleaner
  def self.flush_db
    CustomerPurchase.delete_all
  end
end
