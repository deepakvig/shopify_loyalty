class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  has_many :customer_details
end
