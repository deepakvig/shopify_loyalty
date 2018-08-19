require 'rails_helper'

RSpec.describe CustomerDetail, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  it { should belong_to(:shop) }
  it { should have_many(:loyalty_points) }

  context "Earned points" do
    let(:customer) { FactoryBot.create(:customer_detail) }
    let(:loyalty_point) { FactoryBot.create(:loyalty_point, points: 90.9) }
    
    it "counts loyalty points for a user - without decimals" do
      loyalty_point.customer_detail_id = customer.id
      loyalty_point.save
      expect(customer.points_earned).to eq(90)  
    end

    it "counts all loyalty points for a user to closest integer on the lower side" do
      loyalty_point1 = FactoryBot.create(:loyalty_point, points: 10.2)
      loyalty_point.customer_detail_id = customer.id
      loyalty_point.save
      loyalty_point1.customer_detail_id = customer.id
      loyalty_point1.save
      expect(customer.points_earned).to eq(101)  
    end
  end
end
