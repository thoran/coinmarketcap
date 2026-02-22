require_relative './helper'
require_relative '../lib/CoinMarketCap/Client'

describe CoinMarketCap::Client do
  let(:client){CoinMarketCap::Client.new(api_key: api_key)}

  describe "#airdrops" do
    context "when an id IS provided" do
      it "calls the V1 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:airdrop, {'data' => []}) do |kwargs|
          kwargs[:id] == 1
        end
        client.stub :v1_client, mocked_client do
          client.airdrops(id: 1)
        end
        mocked_client.verify
      end
    end

    context "when an id is NOT provided" do
      it "calls the V1 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect :airdrops, true, []
        client.stub :v1_client, mocked_client do
          client.airdrops
        end
        mocked_client.verify
      end
    end
  end

  describe "#categories" do
    context "when an id IS provided" do
      it "calls the V1 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:category, {'data' => []}) do |kwargs|
          kwargs[:id] == 1
        end
        client.stub :v1_client, mocked_client do
          client.categories(id: 1)
        end
        mocked_client.verify
      end
    end

    context "when an id is NOT provided" do
      it "calls the V1 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect :categories, true, []
        client.stub :v1_client, mocked_client do
          client.categories
        end
        mocked_client.verify
      end
    end
  end

  describe "#gainers_and_losers" do
    it "calls the V1 client trending_gainers_losers method" do
      mocked_client = Minitest::Mock.new
      mocked_client.expect :trending_gainers_losers, true, []
      client.stub :v1_client, mocked_client do
        client.gainers_and_losers
      end
      mocked_client.verify
    end
  end

  describe "#historical_price_data" do
    it "calls the V2 client" do
      mocked_client = Minitest::Mock.new
      mocked_client.expect(:ohlcv_historical, {'data' => []}) do |kwargs|
        kwargs[:id] == 1
      end
      client.stub :v2_client, mocked_client do
        client.historical_price_data(id: 1)
      end
      mocked_client.verify
    end
  end

  describe "#historical_quotes" do
    context "when an ID IS provided" do
      it "calls the V2 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:quotes_historical, {'data' => []}) do |kwargs|
          kwargs[:id] == 1
        end
        client.stub :v2_client, mocked_client do
          client.historical_quotes(id: 1)
        end
        mocked_client.verify
      end
    end

    context "when no ID is provided" do
      it "calls the V1 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect :listings_historical, {"data" => {}}, []
        client.stub :v1_client, mocked_client do
          client.historical_quotes
        end
        mocked_client.verify
      end
    end
  end

  describe "#info" do
    it "calls the V2 client" do
      mocked_client = Minitest::Mock.new
      mocked_client.expect(:info, {'data' => []}) do |kwargs|
        kwargs[:id] == 1
      end
      client.stub :v2_client, mocked_client do
        client.info(id: 1)
      end
      mocked_client.verify
    end
  end

  describe "#map" do
    it "calls the V1 client" do
      mocked_client = Minitest::Mock.new
      mocked_client.expect(:map, {'data' => []})
      client.stub :v1_client, mocked_client do
        client.map
      end
      mocked_client.verify
    end
  end

  describe "#latest_listings" do
    context "WITHOUT args" do
      it "calls the V2 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:market_pairs_latest, true, [{}])
        client.stub :v2_client, mocked_client do
          client.latest_listings
        end
        mocked_client.verify
      end
    end

    context "WITH args" do
      it "calls the V2 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:market_pairs_latest, true, [{limit: 10}])
        client.stub :v2_client, mocked_client do
          client.latest_listings(limit: 10)
        end
        mocked_client.verify
      end
    end
  end

  describe "#latest_price_data" do
    it "calls the V2 client" do
      mocked_client = Minitest::Mock.new
      mocked_client.expect(:ohlcv_latest, true, [])
      client.stub :v2_client, mocked_client do
        client.latest_price_data
      end
      mocked_client.verify
    end
  end

  describe "#latest_price_performance_stats" do
    it "calls the V2 client" do
      mocked_client = Minitest::Mock.new
      mocked_client.expect(:price_performance_stats_latest, true, [])
      client.stub :v2_client, mocked_client do
        client.latest_price_performance_stats
      end
      mocked_client.verify
    end
  end

  describe "#latest_quotes" do
    context "when an ID IS provided" do
      it "calls the V2 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:quotes_latest, {'data' => []}) do |kwargs|
          kwargs[:id] == 1
        end
        client.stub :v2_client, mocked_client do
          client.latest_quotes(id: 1)
        end
        mocked_client.verify
      end
    end

    context "when an ID is NOT provided" do
      it "calls the V1 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:listings_latest, true, [])
        client.stub :v1_client, mocked_client do
          client.latest_quotes
        end
        mocked_client.verify
      end
    end
  end

  describe "#most_visited" do
    it "calls the V1 client trending_most_visited method" do
      mocked_client = Minitest::Mock.new
      mocked_client.expect :trending_most_visited, true, []
      client.stub :v1_client, mocked_client do
        client.most_visited
      end
      mocked_client.verify
    end
  end

  describe "#trending" do
    it "calls the V1 client trending_latest method" do
      mocked_client = Minitest::Mock.new
      mocked_client.expect :trending_latest, true, []
      client.stub :v1_client, mocked_client do
        client.trending
      end
      mocked_client.verify
    end
  end

  describe "#exchange_assets" do
    it "calls the V1 client" do
      mocked_client = Minitest::Mock.new
      mocked_client.expect(:exchange_assets, {'data' => []}) do |kwargs|
        kwargs[:id] == 1
      end
      client.stub :v1_client, mocked_client do
        client.exchange_assets(id: 1)
      end
      mocked_client.verify
    end
  end

  describe "#exchange_info" do
    context "WITHOUT args" do
      it "calls the V1 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:exchange_info, true, [])
        client.stub :v1_client, mocked_client do
          client.exchange_info
        end
        mocked_client.verify
      end
    end

    context "WITH args" do
      it "calls the V1 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:exchange_info, {'data' => []}) do |kwargs|
          kwargs[:id] == 1
        end
        client.stub :v1_client, mocked_client do
          client.exchange_info(id: 1)
        end
        mocked_client.verify
      end
    end
  end

  describe "#exchange_map" do
    context "WITHOUT args" do
      it "calls the V1 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:exchange_map, true, [])
        client.stub :v1_client, mocked_client do
          client.exchange_map
        end
        mocked_client.verify
      end
    end

    context "WITH args" do
      it "calls the V1 client" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:exchange_map, {'data' => []}) do |kwargs|
          kwargs[:listing_status] == 'active'
        end
        client.stub :v1_client, mocked_client do
          client.exchange_map(listing_status: 'active')
        end
        mocked_client.verify
      end
    end
  end

  describe "#exchange_listings" do
    context "WITHOUT args" do
      it "calls the V1 client exchange_listings_latest method" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:exchange_listings_latest, true, [])
        client.stub :v1_client, mocked_client do
          client.exchange_listings
        end
        mocked_client.verify
      end
    end

    context "WITH args" do
      it "calls the V1 client exchange_listings_latest method" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:exchange_listings_latest, {'data' => []}) do |kwargs|
          kwargs[:limit] == 10
        end
        client.stub :v1_client, mocked_client do
          client.exchange_listings(limit: 10)
        end
        mocked_client.verify
      end
    end
  end

  describe "#exchange_market_pairs" do
    context "WITHOUT args" do
      it "calls the V1 client exchange_market_pairs_latest method" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:exchange_market_pairs_latest, true, [])
        client.stub :v1_client, mocked_client do
          client.exchange_market_pairs
        end
        mocked_client.verify
      end
    end

    context "WITH args" do
      it "calls the V1 client exchange_market_pairs_latest method" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:exchange_market_pairs_latest, {'data' => []}) do |kwargs|
          kwargs[:id] == 1
        end
        client.stub :v1_client, mocked_client do
          client.exchange_market_pairs(id: 1)
        end
        mocked_client.verify
      end
    end
  end

  describe "#exchange_quotes" do
    context "when historical is false (default)" do
      it "calls the V1 client exchange_quotes_latest method" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:exchange_quotes_latest, {'data' => []}) do |kwargs|
          kwargs[:id] == 1
        end
        client.stub :v1_client, mocked_client do
          client.exchange_quotes(id: 1)
        end
        mocked_client.verify
      end
    end

    context "when historical is true" do
      it "calls the V1 client exchange_quotes_historical method" do
        mocked_client = Minitest::Mock.new
        mocked_client.expect(:exchange_quotes_historical, {'data' => []}) do |kwargs|
          kwargs[:id] == 1
        end
        client.stub :v1_client, mocked_client do
          client.exchange_quotes(historical: true, id: 1)
        end
        mocked_client.verify
      end
    end
  end
end
