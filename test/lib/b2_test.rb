# frozen_string_literal: true

require 'test_helper'

class B2Test < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::B2::VERSION
  end

  def test_create_client
    client = B2.create_client do |config|
      config.app_key = ""
      config.app_key_id = ""
    end
    client.authorize_account
    upload_auth = client.get_upload_url("")
  end
end
