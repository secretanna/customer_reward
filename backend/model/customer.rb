# frozen_string_literal: true

class CustomerPurchase < ActiveRecord::Base
  has_many :customer_purchases

  validates :name, unique: true
end
