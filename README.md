[![Build Status](https://travis-ci.org/Flowspace-Team/mws-merchant_fulfillment.svg?branch=master)](https://travis-ci.org/Flowspace-Team/mws-merchant_fulfillment)
[![Gem Version](https://badge.fury.io/rb/mws-merchant_fulfillment.svg)](https://badge.fury.io/rb/mws-merchant_fulfillment)

# MWS Merchant Fulfillment

**MWS Merchant Fulfillment** is a Ruby interface to the [Amazon Marketplace Web Service (MWS) Merchant Fulfillment API](http://docs.developer.amazonservices.com/en_US/merch_fulfill/index.html). With the MWS Merchant Fulfillment API, you can build applications that let sellers purchase shipping for non-Prime and Prime orders using Amazon’s Buy Shipping Services.

(To use Amazon MWS, you must have an Amazon MWS developer account.)

## Usage

Create a client:

```ruby
require "mws-merchant_fulfillment"
client = MWS.merchant_fulfillment(marketplace: "ATVPDKIKX0DER", merchant_id: "123")
```

Set up credentials [when instantiating or with environment variables](https://github.com/hakanensari/peddler#usage).

### Eligible Shipping Services

List orders created or updated during a time frame you specify:

```ruby
response = client.get_eligible_shipping_services(
  amazon_order_id: amazon_order_id,
  item_list: items,
  ship_from_address: shipping_from,
  package_dimensions: package_dimensions,
  weight: weight,
  shipping_service_options: {
    delivery_experience: 'DeliveryConfirmationWithoutSignature',
    carrier_will_pick_up: false,
  },
)
shipping_services = response.parse
puts shipping_services.rates.count # => 1
puts shipping_services.rates.first.amount # => #<Money fractional:2 currency:USD>
```

### Service Status

Check the operational status of the API:

```ruby
client.get_service_status.parse
```
