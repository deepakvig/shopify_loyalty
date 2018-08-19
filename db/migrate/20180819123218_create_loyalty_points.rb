class CreateLoyaltyPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :loyalty_points do |t|
      t.string :order_number
      t.float :points
      t.references :customer_detail, foreign_key: true

      t.timestamps
    end
  end
end
