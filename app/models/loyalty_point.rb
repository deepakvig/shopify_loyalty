class LoyaltyPoint < ApplicationRecord
  belongs_to :customer_detail

  validates_presence_of :order_number, :points
end
