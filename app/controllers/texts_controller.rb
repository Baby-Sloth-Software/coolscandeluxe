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
    #
    phone_number = params['From']
    customer = Customer.find_by_phone(phone_number)

    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Hey #{customer.first_name} #{customer.last_name}. Thanks for the message!"
    end
    render xml: twiml.text
  end
end