# @quote = nil
# @recipient = nil
# @number = nil


get '/' do
	erb :index
end

get '/send_sms/:recipient/:phone_number' do
	@quote = Controller.get_random_quote
	@phone_number = params[:phone_number]
	@recipient = params[:recipient]
	@message = Controller.create_message(@quote, @recipient)
	Controller.send_message(@message, @phone_number)
	Controller.log_call(@recipient, @phone_number, @quote)
	redirect "/"
end

get '/confirmation' do
	@phone_number = params[:phone_number]
	@recipient = params[:recipient]
	erb :confirmation
end

get '/reply_sms' do
	@number = params[:from][2..-1]
	@call = CallLog.where('number=?' @number)
	@president = @call.president.name
	@name = @call.name
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "It was good to hear from you my beloved #{@name}! By the way, you can call me #{@president}. XOXO"
  end
  twiml.text
end

# get '/respond_to_sms' do
#   twiml = Twilio::TwiML::Response.new do |r|
#     r.Message "It was good to hear from you my beloved Ian! By the way, you can call me Tricky Dick. XOXO"
#   end
#   twiml.text
# end