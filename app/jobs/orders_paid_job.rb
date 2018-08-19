class OrdersPaidJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)

    shop.with_shopify_session do
      # Customer Details
      customer_id = webhook[:customer][:id] # Customer ID from Shopify Order details
      customer_email = webhook[:customer][:email] # Customer Email from Shopify Order details
      customer_fname = webhook[:customer][:first_name] # Customer FirstName from Shopify Order details
      customer_lname = webhook[:customer][:last_name] # Customer LastName from Shopify Order details
      #Order Details
      order_total = webhook[:total_price] # Order Total
      order_number = webhook[:id] # Order ID from Shopify
      
      # Find customer details if already present
      customer = shop.customer_details.find_by(shopify_customer_id: customer_id)

      # Create customer record if not present
      customer ||= shop.customer_details.create!(
                      shopify_customer_id: customer_id,
                      email: customer_email,
                      first_name: customer_fname,
                      last_name: customer_lname
                    )

      # Check if Order details are already present
      loyalty_point = customer.loyalty_points.find_by(order_number: order_number)

      if loyalty_point
        # Update record
        loyalty_point.points = order_total
        loyalty_point.save!
      else
        # Create a record
        customer.loyalty_points.create!(
          order_number: order_number,
          points: order_total
        )
      end     
    end
  end
end
