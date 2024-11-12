# frozen_string_literal: true

require_relative 'db_connection'
require_relative 'seeds'
require_relative 'cleaner'
require_relative 'customer_rewards/db_quering_finder'

DatabaseConnection.new.establish

Cleaner.flush_db

Seeds.new.call

finder = CustomerRewards::DbQueringFinder.new

puts finder.earned_rewards_for(234_234)
