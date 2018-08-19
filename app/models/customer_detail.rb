class CustomerDetail < ApplicationRecord
  belongs_to :shop
  has_many :loyalty_points

  validates_presence_of :email, :first_name, :last_name

  # Get details related to earned points for each Customer
  def points_earned
    loyalty_points.sum(:points).floor
  end
end
