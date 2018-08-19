ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "74dea5f2db288a6d9a8489189a250c7a"
  config.secret = "564a9da8b7355450e70aee4f3e0d8cbb"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.webhooks = [
    {topic: 'orders/paid', address: 'https://infinite-shelf-30866.herokuapp.com/webhooks/orders_paid', format: 'json'},
  ]
end
