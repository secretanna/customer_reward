# frozen_string_literal: true

module CustomerRewards
  class BasicFinder
    def initialize
      raise NotImplementedError
    end

    def earned_rewards_for(customer_id)
      raise NotImplementedError
    end
  end
end
