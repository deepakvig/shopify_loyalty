# Get the config key and secret from shopify_app.yml
shopify_app_config = Rails.application.config_for(:shopify_app)

ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = shopify_app_config.fetch('api_key')
  config.secret = shopify_app_config.fetch('secret')
  config.scope = "read_customers, read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.webhooks = [
    {topic: 'orders/paid', address: 'https://infinite-shelf-30866.herokuapp.com/webhooks/orders_paid', format: 'json'},
  ]
end
