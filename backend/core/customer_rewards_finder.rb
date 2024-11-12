# frozen_string_literal: true

class CustomerRewardsFinder
  def initialize
    @rewarded_list = []

    find_all_rewarded_customers
  end

  def earned_rewards_for(customer_id)
    earned_rewards = []
    @rewarded_list.each do |reward|
      next if reward[:customer_ids]&.exclude? customer_id

      earned_rewards << reward[:title]
    end

    earned_rewards
  end

  private

  def find_all_rewarded_customers
    Reward.find_each do |reward|
      @rewarded_list << { title: reward.name, customer_ids: customer_ids_for(reward) }
    end
  end

  def customer_ids_for(reward)
    ActiveRecord::Base.connection.execute(reward.query_rule).map do |result|
      result['customer_id']
    end.flatten
  end
end
