# frozen_string_literal: true

module B2
  module Auth
    BASE_URL = 'https://api.backblazeb2.com/b2api/v2'

    def authorize_account
      basic_auth = {
        username: B2::Config.app_key_id,
        password: B2::Config.app_key
      }
      response = get("#{BASE_URL}/b2_authorize_account", basic_auth: basic_auth)
      config.auth_response = response
    end

    def create_key(key_name, capabilities, options = {})
      payload = {
        body: {
          accountId: config.account_id,
          capabilities: capabilities,
          keyName: key_name
        }.merge(options).to_json
      }
      post("#{config.api_url}/b2api/v2/b2_create_key", payload)
    end

    def delete_key(application_key_id)
      payload = {
        body: { applicationKeyId: application_key_id }.to_json
      }
      post("#{config.api_url}/b2api/v2/b2_delete_key", payload)
    end

    def list_keys(options = {})
      payload = {
        body: {
          accountId: config.account_id
        }.merge(options).to_json
      }
      post("#{config.api_url}/b2api/v2/b2_list_keys", payload)
    end

    def get_download_authorization(bucket_id, file_name_prefix, valid_duration_in_seconds, options = {})
      payload = {
        body: {
          bucketId: bucket_id,
          fileNamePrefix: file_name_prefix,
          validDurationInSeconds: valid_duration_in_seconds
        }.merge(options).to_json
      }
      post("#{config.api_url}/b2api/v2/b2_get_download_authorization", payload)
    end
  end
end
