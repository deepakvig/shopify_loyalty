class HomeController < ShopifyApp::AuthenticatedController
  def index
    # Show all customers who have paid for their orders
    @customers = shop.customer_details
  end
end
