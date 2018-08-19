class HomeController < ShopifyApp::AuthenticatedController
  def index
    # Show all customers who have paid for their orders
    @customers = shop.try(:customer_details) || []
  end

  private

  def shop
    # Return nil in case session is not present
    return unless shop_session.present?

    # Get shop details from the database based on session url
    @shop ||= Shop.find_by(shopify_domain: shop_session.url)
  end
end
