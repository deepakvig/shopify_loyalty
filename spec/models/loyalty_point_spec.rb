require 'rails_helper'

RSpec.describe LoyaltyPoint, type: :model do
  it { is_expected.to validate_presence_of(:order_number) }
  it { is_expected.to validate_presence_of(:points) }
end
