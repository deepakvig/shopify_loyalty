class HomeController < ShopifyApp::AuthenticatedController
  def index
    # Show all customers who have paid for their orders
    @customers = shop.customer_details
  end

  private

  def shop
    p shop_session
    @shop ||= Shop.find_by(shopify_domain: shop_session.url)
  end
end
