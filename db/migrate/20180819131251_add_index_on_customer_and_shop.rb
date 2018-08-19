class AddIndexOnCustomerAndShop < ActiveRecord::Migration[5.1]
  def change
    add_index :customer_details, [:shopify_customer_id, :shop_id]
  end
end
