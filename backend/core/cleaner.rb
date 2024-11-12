# frozen_string_literal: true

require_relative '../models/customer_purchase'
require_relative '../models/reward'

class Cleaner
  def self.flush_db
    CustomerPurchase.delete_all
    Reward.delete_all
  end
end
