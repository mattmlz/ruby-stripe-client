# External lib (GEMs)
require 'sinatra'
require 'rest-client'
require 'json'

# Internal lib
require './lib/stripe_client'
require './lib/stripe_client/client'
require './lib/stripe_client/charge'

get '/' do
  'Hello world!'
end

post '/payment' do
  #Extract params
  payload = JSON.parse(request.body.read)
  puts "params: #{payload}"

  #Instantiate a new Stripe Client
  client = StripeClient::Client.new(api_key: StripeClient::PRIVATE_KEY)
  
  #Charge -> Pay in Stripe
  StripeClient::Charge.new(client).create(payload)
end