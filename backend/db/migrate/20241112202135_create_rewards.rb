class CreateRewards < ActiveRecord::Migration[7.2]
  def change
    create_table :rewards do |t|
      t.string :query_rule, null: false
      t.string :name, null: false, index: :uniq
    end
  end
end
