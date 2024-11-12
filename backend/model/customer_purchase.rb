# frozen_string_literal: true

class CustomerPurchase < ActiveRecord::Base
  belongs_to :customer

  validates :purchase_amount_cents, presence: true
end
