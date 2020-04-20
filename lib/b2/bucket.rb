# frozen_string_literal: true

module B2
  module Bucket
    def create_bucket(name, type = 'allPrivate', options = {})
      payload = {
        body: {
          accountId: config.account_id,
          bucketName: name,
          bucketType: type
        }.merge(options).to_json
      }
      post("#{config.api_url}/b2api/v2/b2_create_bucket", payload)
    end

    def list_buckets(options = {})
      payload = {
        body: {
          accountId: config.account_id
        }.merge(options).to_json
      }
      post("#{config.api_url}/b2api/v2/b2_list_buckets", payload)
    end

    def update_bucket(id, options = {})
      payload = {
        body: {
          accountId: config.account_id,
          bucketId: id
        }.merge(options).to_json
      }
      post("#{config.api_url}/b2api/v2/b2_update_bucket", payload)
    end

    def delete_bucket(id)
      payload = {
        body: {
          accountId: config.account_id,
          bucketId: id
        }.to_json
      }
      post("#{config.api_url}/b2api/v2/b2_delete_bucket", payload)
    end
  end
end
