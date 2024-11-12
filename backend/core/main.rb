# frozen_string_literal: true

require_relative 'db_connection'
require_relative 'seeds'
require_relative 'cleaner'
require_relative 'customer_rewards_finder'
require_relative '../models/reward'

DatabaseConnection.new.establish

Cleaner.flush_db

Seeds.new.call

puts CustomerRewardsFinder.new.earned_rewards_for(234_234)
