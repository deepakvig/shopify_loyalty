class CreateCustomerDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_details do |t|
      t.string :shopify_customer_id
      t.string :email
      t.string :first_name
      t.string :last_name
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
