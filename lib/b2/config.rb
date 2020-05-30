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

      def min_part_size
        auth_response['absoluteMinimumPartSize']
      end

      def recommended_part_size
        auth_response['recommendedPartSize']
      end
    end
  end
end
