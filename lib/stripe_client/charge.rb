module StripeClient
  class Charge
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def create(params)
      RestClient.post(
        "https://api.stripe.com/v1/charges",
        {
          amount: params['amount'],
          currency: "EUR",
          source: params['card_token'],
          description: "Example from Ruby! (day 2)"
        },
        {
          authorization: "Bearer #{client.api_key}"
        }
      )
    end

  end
    # curl https://api.stripe.com/v1/charges \
    # -u sk_test_RRrY3YfnXgxtETDhq243nYxw007STbZQu3: \
    # -d amount=2000 \
    # -d currency=eur \
    # -d source=tok_mastercard \
end