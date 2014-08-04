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
	p params
	# @number = #some shit here
	# @call = CallLog.where('number=?' @number)
	# @president = @call.president
	# @name = @call.name
end

# get '/respond_to_sms' do
#   twiml = Twilio::TwiML::Response.new do |r|
#     r.Message "It was good to hear from you my beloved Ian! By the way, you can call me Tricky Dick. XOXO"
#   end
#   twiml.text
# end