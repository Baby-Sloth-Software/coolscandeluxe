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

    if customer.start?
      product = params['Body']
      message = "Hey #{customer.first_name}!  It's great to hear that you need more #{product}.  Please reply 1 to CONFIRM or 2 to CANCEL."
      customer.conversation_state = :determine_product
      customer.conversation_id = params['MessageSid']
    elsif customer.determine_product?

    elsif customer.product_confirmed?

    elsif customer.order_confirmed?

    end

    twiml = Twilio::TwiML::Response.new do |r|
      r.Message message
    end
    render xml: twiml.text
  end
end