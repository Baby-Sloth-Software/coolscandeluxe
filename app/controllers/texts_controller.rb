class TextsController < ApplicationController

  def index
    # Parameters: {"ToCountry"=>"US",
    #              "ToState"=>"GA",
    #              "SmsMessageSid"=>"SMecadf0061ffb938491ccfc1164a1e2fc",
    #              "NumMedia"=>"0", "ToCity"=>"COLUMBUS", "FromZip"=>"32801",
    #              "SmsSid"=>"SMecadf0061ffb938491ccfc1164a1e2fc",
    #              "FromState"=>"FL", "SmsStatus"=>"received", "FromCity"=>"ORLANDO", "Body"=>"Hey", "FromCountry"=>"US",
    #              "To"=>"+16787862528", "ToZip"=>"31901", "NumSegments"=>"1",
    #              "MessageSid"=>"SMecadf0061ffb938491ccfc1164a1e2fc", "AccountSid"=>"AC389ab8c76fd5d42343da183110d741e8",
    #              "From"=>"+14072837742", "ApiVersion"=>"2010-04-01"}

    phone_number = params['From']
    customer = Customer.find_by_phone(phone_number)

    if customer.start? || customer.conversation_state.nil? || customer.order_confirmed?
      product = Product.find_by_name(params['Body'].titleize)
      message = "Hey #{customer.first_name}!  It's great to hear that you need more #{product.name.titleize}.  Please reply 1 to CONFIRM or 2 to CANCEL."
      session['product'] = product.name
      customer.update(conversation_state: Customer.conversation_states[:determine_product], conversation_id: params['MessageSid'])
    elsif customer.determine_product?
      product = Product.find_by_name(session['product'])
      response = params['Body'].to_i
      if response == 1
        customer.update(conversation_state: Customer.conversation_states[:product_confirmed], conversation_id: params['MessageSid'])
        message = "Stock Request for #{session['product']}: Please reply with a quantity."
      else
        customer.update(conversation_state: Customer.conversation_states[:start], conversation_id: params['MessageSid'])
        message = "Stock Request for #{session['product']} Cancelled."
      end
    elsif customer.product_confirmed?
      quantity = params['Body'].to_i
      product = Product.find_by_name(session['product'])

      customer.update(conversation_state: Customer.conversation_states[:order_confirmed], conversation_id: params['MessageSid'])
      order = Order.create(customer: customer, product: product, quantity: quantity)
      message = "Order #{order.id} created for Product: #{product.name} - Quantity: #{quantity}.  Thanks for using StockMyCooler powered by Coca-Cola!"
    else

    end

    twiml = Twilio::TwiML::Response.new do |r|
      r.Message message
    end
    render xml: twiml.text
  end
end