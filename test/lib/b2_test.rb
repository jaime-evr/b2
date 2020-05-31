# frozen_string_literal: true

require "test_helper"

describe "B2" do

  it "has a version number" do
    refute_nil ::B2::VERSION
  end

  describe "#create_client" do
    let(:client) do
      B2.create_client do |config|
        config.app_key = "API_KEY"
        config.app_key_id = "API_KEY_ID"
      end
    end

    it "should return an instance of B2" do
      assert_instance_of B2::Client, client
    end
  end
end
