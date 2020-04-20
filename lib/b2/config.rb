# frozen_string_literal: true

module B2
  module Config
    class << self
      attr_accessor :app_key, :app_key_id, :auth_response

      def auth_token
        auth_response['authorizationToken']
      end

      def api_url
        auth_response['apiUrl']
      end

      def account_id
        auth_response['accountId']
      end

      def download_url
        auth_response['downloadUrl']
      end
    end
  end
end
