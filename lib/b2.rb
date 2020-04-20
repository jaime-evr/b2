# frozen_string_literal: true

require 'b2/version'
require 'b2/config'
require 'b2/client'

module B2
  # Creates a new +B2::Client+ object
  #
  def self.create_client
    yield B2::Config
    B2::Client.new
  end
end
