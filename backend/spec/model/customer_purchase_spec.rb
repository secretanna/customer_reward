require 'active_record'
require_relative '../../models/customer_purchase'

RSpec.describe 'CustomerPurchase' do
  def db_configuration
    db_configuration_file = File.join(File.expand_path('../../..', __FILE__), 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file), aliases: true)
  end

  before do
    ActiveRecord::Base.establish_connection(db_configuration["development"])
  end

  it 'validates customer_id presence' do
    expect { CustomerPurchase.create!(purchase_amount_cents: 1000) }.to raise_error(ActiveRecord::RecordInvalid) 
  end

  it 'validates purchase_amount_cents presence' do
    expect { CustomerPurchase.create!(customer_id: 1) }.to raise_error(ActiveRecord::RecordInvalid) 
  end

  it 'creates a valid entity' do
    expect { CustomerPurchase.create!(customer_id: 1, purchase_amount_cents: 1000) }.to change(CustomerPurchase, :count).by(1)
  end

  after do
    CustomerPurchase.delete_all
  end
end
