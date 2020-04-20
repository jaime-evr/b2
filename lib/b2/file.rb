# frozen_string_literal: true

module B2
  module File
    def get_upload_url(bucket_id)
      payload = { body: { bucketId: bucket_id }.to_json }
      post("#{config.api_url}/b2api/v2/b2_get_upload_url", payload)
    end

    def download_file_by_id(file_id, options = {})
      payload = options.any? ? { headers: options.merge(Authorization: config.auth_token) } : {}
      get("#{config.api_url}/b2api/v2/b2_download_file_by_id?fileId=#{file_id}", payload)
    end

    def download_file_by_name(bucket_name, file_name, url_params = {}, options = {})
      payload = options.any? ? { headers: options.merge(Authorization: config.auth_token) } : {}
      query = URI.encode_www_form(url_params)
      get("#{config.api_url}/file/#{bucket_name}/#{file_name}?#{query}", payload)
    end

    def delete_file_version(file_name, file_id)
      payload = {
        body: {
          fileName: file_name,
          fileId: file_id
        }.to_json
      }
      post("#{config.api_url}/b2api/v2/b2_delete_file_version", payload)
    end

    def get_file_info(file_id)
      payload = { body: { fileId: file_id }.to_json }
      post("#{config.api_url}/b2api/v2/b2_get_file_info", payload)
    end

    def hide_file(bucket_id, file_name)
      payload = {
        body: {
          bucketId: bucket_id,
          fileName: file_name
        }.to_json
      }
      post("#{config.api_url}/b2api/v2/b2_hide_file", payload)
    end

    def copy_file(file_name, source_file_id, options = {})
      payload = {
        body: {
          fileName: file_name,
          sourceFileId: source_file_id
        }.merge(options).to_json
      }
      post("#{config.api_url}/b2api/v2/b2_copy_file", payload)
    end

    def list_file_names(bucket_id, options = {})
      payload = { body: { bucketId: bucket_id }.merge(options).to_json }
      post("#{config.api_url}/b2api/v2/b2_list_file_names", payload)
    end

    def list_file_versions(bucket_id, options = {})
      payload = { body: { bucketId: bucket_id }.merge(options).to_json }
      post("#{config.api_url}/b2api/v2/b2_list_file_versions", payload)
    end

    def upload_file(file_name, body, upload_auth, content_type = 'b2/x-auto', options = {})
      payload = {
        headers: {
          "Authorization": upload_auth['authorizationToken'],
          "X-Bz-File-Name": file_name,
          "Content-Type": content_type,
          "Content-Length": body.size.to_s,
          "X-Bz-Content-Sha1": Digest::SHA1.hexdigest(body)
        }.merge(options),
        body: body
      }
      post(upload_auth['uploadUrl'], payload)
    end
  end
end
