# frozen_string_literal: true

module B2
  module Base
    private

    %i[get head post put].each do |req|
      define_method(req) do |path, options = {}, &block|
        self.class.send(req, path, formatted_options(options), &block)
      end
    end

    def formatted_options(options)
      return options if options[:headers]
      return options unless config.auth_response

      options.merge(headers: { Authorization: config.auth_token })
    end
  end
end
