require 'dotenv/load'
require "autobuy/version"
require 'coinbase/exchange'

module Autobuy
  class Error < StandardError; end

  class Base
    def initialize(product: 'ETH-USD')
      @product = product
    end

    def client
      api_key = ENV['COINBASE_KEY'] || ''
      api_secret = ENV['COINBASE_SECRET'] || ''
      api_pass = ENV['COINBASE_PASS'] || ''
      api_url = ENV['COINBASE_API'] || 'https://api.pro.coinbase.com'
      @client ||= Coinbase::Exchange::Client.new(api_key,
                                                 api_secret,
                                                 api_pass,
                                                 product_id: @product,
                                                 api_url: api_url
                                                )
    end

    def buy(usd_amount: nil)
      #amount to buy
      usd_amount ||= 5.0
      #dicount off current price to bid
      discount_to_current_price = ENV['BID_DISCOUNT'] || 0.05
      #get the currentprice
      current_usd_price = last_trade_price
      #amount of crypto to buy
      currency_amount_to_buy = ((usd_amount.to_f) / current_usd_price).to_f.round(2)
      # bid price
      bid = (current_usd_price - discount_to_current_price.to_f).to_f.round(5)
      p "Place limit order for #{currency_amount_to_buy} @ #{bid}"
      client.buy(currency_amount_to_buy, bid) do |resp|
        p "Order placed ID: #{resp.id}"
      end
    end

    def orders
      client.orders(status: 'open')
    end

    def last_trade_price
      price = 0.0
      price = client.last_trade.price
      p "Last trade spot rate is $ %.2f" % price
      price
    end

    def products
      client.products
    end
  end
end
