class HomeController < ShopifyApp::AuthenticatedController
  def index
    # Show all customers who have paid for their orders
    @customers = shop.try(:customer_details) || []
  end

  private

  def shop
    return unless shop_session.present?
    @shop ||= Shop.find_by(shopify_domain: shop_session.url)
  end
end
