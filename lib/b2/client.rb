# frozen_string_literal: true

require 'httparty'
require 'b2/auth'
require 'b2/base'
require 'b2/bucket'
require 'b2/file'
require 'b2/large_file'

module B2
  class Client
    include HTTParty
    include B2::Base
    include B2::Auth
    include B2::Bucket
    include B2::File
    include B2::LargeFile

    def config
      B2::Config
    end
  end
end
