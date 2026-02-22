# CoinMarketCap/V1/Client.rb
# CoinMarketCap::V1::Client

# Notes:
# 1. From https://coinmarketcap.com/api/documentation/v1/#tag/cryptocurrency
# /v1/cryptocurrency/airdrop - Airdrop
# /v1/cryptocurrency/airdrops - Airdrops
# /v1/cryptocurrency/categories - Categories
# /v1/cryptocurrency/category - Category
# /v1/cryptocurrency/listings/historical - Historical listings
# /v1/cryptocurrency/listings/latest - Latest listings
# /v1/cryptocurrency/map - CoinMarketCap ID map
# /v1/cryptocurrency/trending/gainers-losers - Trending Gainers & Losers
# /v1/cryptocurrency/trending/latest - Trending Latest
# /v1/cryptocurrency/trending/most-visited - Trending Most Visited

gem 'http.rb'
require 'http.rb'
require 'json'
require_relative '../Common'

module CoinMarketCap
  module V1
    class Client
      include Common

      class << self
        def path_prefix
          '/v1'
        end
      end # class << self

      # /cryptocurrency

      def airdrop(id:)
        response = get(path: '/cryptocurrency/airdrop', args: {id: id})
        handle_response(response)
      end

      def airdrops
        response = get(path: '/cryptocurrency/airdrops')
        handle_response(response)
      end

      def categories
        response = get(path: '/cryptocurrency/categories')
        handle_response(response)
      end

      def category(id:)
        response = get(path: '/cryptocurrency/category', args: {id: id})
        handle_response(response)
      end

      def listings_historical
        response = get(path: '/cryptocurrency/listings/historical')
        handle_response(response)
      end

      def listings_latest(**args)
        response = get(path: '/cryptocurrency/listings/latest', args: args)
        handle_response(response)
      end

      def map
        response = get(path: '/cryptocurrency/map')
        handle_response(response)
      end

      def trending_gainers_losers
        response = get(path: '/cryptocurrency/trending/gainers-losers')
        handle_response(response)
      end

      def trending_latest
        response = get(path: '/cryptocurrency/trending/latest')
        handle_response(response)
      end

      def trending_most_visited
        response = get(path: '/cryptocurrency/trending/most-visited')
        handle_response(response)
      end

      # /exchange

      def exchange_assets(id:)
        response = get(path: '/exchange/assets', args: {id: id})
        handle_response(response)
      end

      def exchange_info(**args)
        response = get(path: '/exchange/info', args: args)
        handle_response(response)
      end

      def exchange_map(**args)
        response = get(path: "/exchange/map", args: args)
        handle_response(response)
      end

      def exchange_listings_latest(**args)
        response = get(path: "/exchange/listings/latest", args: args)
        handle_response(response)
      end

      def exchange_market_pairs_latest(**args)
        response = get(path: "/exchange/market-pairs/latest", args: args)
        handle_response(response)
      end

      def exchange_quotes_historical(**args)
        response = get(path: "/exchange/quotes/historical", args: args)
        handle_response(response)
      end

      def exchange_quotes_latest(**args)
        response = get(path: "/exchange/quotes/latest", args: args)
        handle_response(response)
      end
    end
  end
end
