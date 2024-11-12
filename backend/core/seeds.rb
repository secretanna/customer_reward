# frozen_string_literal: true

require_relative '../models/customer_purchase'
require_relative '../models/reward'

class Seeds
  def call
    create_customer_purchases
    create_rewards
  end

  private

  def create_customer_purchases
    customer_purchases = [{ customer_id: 65, purchase_amount_cents: 1800, created_at: Time.utc(2009, 1, 2, 6, 1) },
                          { customer_id: 31_337, purchase_amount_cents: 6522,
                            created_at: Time.utc(2009, 5, 4, 6, 12) },
                          { customer_id: 4465, purchase_amount_cents: 987, created_at: Time.utc(2010, 8, 17, 11, 9) },
                          { customer_id: 234_234, purchase_amount_cents: 200,
                            created_at: Time.utc(2024, 11, 1, 16, 12) },
                          { customer_id: 12_445, purchase_amount_cents: 1664,
                            created_at: Time.utc(2010, 11, 18, 13, 19) },
                          { customer_id: 234_234, purchase_amount_cents: 1200,
                            created_at: Time.utc(2024, 11, 10, 16, 12) },
                          { customer_id: 12_445, purchase_amount_cents: 1800,
                            created_at: Time.utc(2010, 12, 3, 11, 17) },
                          { customer_id: 65, purchase_amount_cents: 900, created_at: Time.utc(2011, 4, 28, 13, 16) },
                          { customer_id: 65, purchase_amount_cents: 1600, created_at: Time.utc(2011, 5, 4, 11, 1) }]

    customer_purchases.each do |seed_hash|
      CustomerPurchase.create!(**seed_hash)
    end
  end

  def create_rewards
    rewards = [
      { name: 'next purchase free',
        query_rule: 'SELECT DISTINCT customer_id FROM customer_purchases WHERE purchase_amount_cents > 1500' },
      { name: 'twenty percent off next order',
        query_rule: "WITH RecentOrders AS (
                                            SELECT
                                                customer_id,
                                                COUNT(id) AS order_count,
                                                MIN(created_at) AS first_order_date,
                                                MAX(created_at) AS second_order_date
                                            FROM
                                                customer_purchases
                                            WHERE
                                                created_at > date('now', '-30 days')
                                            GROUP BY
                                                customer_id
                                            HAVING
                                                COUNT(id) >= 2
                                        )

                    SELECT DISTINCT
                        customer_id
                    FROM
                        RecentOrders
                    WHERE
                        order_count = 2;" },
      { name: 'Star Wars themed item added to delivery',
        query_rule: "SELECT DISTINCT customer_id FROM customer_purchases WHERE strftime('%m-%d', created_at) = '05-04';" }
    ]

    rewards.each do |seed_hash|
      Reward.create!(**seed_hash)
    end
  end
end
