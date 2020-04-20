# frozen_string_literal: true

module B2
  module LargeFile
    def start_large_file(bucket_id, file_name, content_type = 'b2/x-auto', options = {})
      payload = {
        body: {
          bucketId: bucket_id,
          fileName: file_name,
          contentType: content_type
        }.merge(options).to_json
      }
      post("#{config.api_url}/b2api/v2/b2_start_large_file", payload)
    end

    def get_upload_part_url(file_id)
      payload = { body: { fileId: file_id }.to_json }
      post("#{config.api_url}/b2api/v2/b2_get_upload_part_url", payload)
    end

    def cancel_large_file(file_id)
      payload = { body: { fileId: file_id }.to_json }
      post("#{config.api_url}/b2api/v2/b2_cancel_large_file", payload)
    end

    def upload_part(part_number, body, upload_auth)
      payload = {
        headers: {
          "Authorization": upload_auth['authorizationToken'],
          "X-Bz-Part-Number": part_number,
          "Content-Length": body.size.to_s,
          "X-Bz-Content-Sha1": Digest::SHA1.hexdigest(body)
        },
        body: body
      }
      post(upload_auth['uploadUrl'], payload)
    end

    def copy_part(large_file_id, part_number, source_file_id, range = nil)
      payload = {
        body: {
          largeFileId: large_file_id,
          partNumber: part_number,
          sourceFileId: source_file_id,
          range: range
        }.to_json
      }
      post("#{config.api_url}/b2api/v2/b2_copy_file", payload)
    end

    def finish_large_file(file_id, part_sha1_array)
      payload = {
        body: {
          fileId: file_id,
          partSha1Array: part_sha1_array
        }.to_json
      }
      post("#{config.api_url}/b2api/v2/b2_finish_large_file", payload)
    end

    def list_parts(file_id, options = {})
      payload = {
        body: { fileId: file_id }.merge(options).to_json
      }
      post("#{config.api_url}/b2api/v2/b2_list_parts", payload)
    end

    def list_unfinished_large_files(bucket_id, options = {})
      payload = {
        body: { bucketId: bucket_id }.merge(options).to_json
      }
      post("#{config.api_url}/b2api/v2/b2_list_unfinished_large_files", payload)
    end
  end
end
