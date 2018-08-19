class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def shop
    p shop_session
    return unless shop_session.present?
    @shop ||= Shop.find_by(shopify_domain: shop_session.url)
  end
end
