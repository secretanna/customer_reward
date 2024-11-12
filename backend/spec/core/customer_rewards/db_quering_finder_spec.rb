require 'active_record'
require_relative '../../../core/customer_rewards/db_quering_finder'
require_relative '../../../core/seeds'


RSpec.describe 'DbQueringFinder' do
  def db_configuration
    db_configuration_file = File.join(File.expand_path('../../../..', __FILE__), 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file), aliases: true)
  end

  before do
    ActiveRecord::Base.establish_connection(db_configuration["development"])

    Seeds.new.call
  end

  context 'when customer has one reward' do
    it 'returns reward for a given customer' do
      expect(CustomerRewards::DbQueringFinder.new.earned_rewards_for(234_234)).to eq('For customer#234234: twenty percent off next order')
    end
  end

  context 'when customer has several reward' do
    it 'returns the latest reward for a given customer' do
      expect(CustomerRewards::DbQueringFinder.new.earned_rewards_for(65)).to eq('For customer#65: Star Wars themed item added to delivery')
    end
  end

  context 'when customer has no reward' do
    it 'returns the zero reward message' do
      expect(CustomerRewards::DbQueringFinder.new.earned_rewards_for(4465)).to eq('There are no rewards for customer#4465')
    end
  end

  context 'when there are no customer_purchases for a customer' do
    it 'returns the zero reward message' do
      expect(CustomerRewards::DbQueringFinder.new.earned_rewards_for(1)).to eq('There are no rewards for customer#1')
    end
  end

  after do
    CustomerPurchase.delete_all
    Reward.delete_all
  end
end
