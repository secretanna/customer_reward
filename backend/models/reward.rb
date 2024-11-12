# frozen_string_literal: true

class Reward < ActiveRecord::Base
  validates :query_rule, presence: true
  validates :name, presence: true
end
  