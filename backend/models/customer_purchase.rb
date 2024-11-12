# frozen_string_literal: true

class CustomerPurchase < ActiveRecord::Base
  validates :purchase_amount_cents, presence: true
  validates :customer_id, presence: true
end
