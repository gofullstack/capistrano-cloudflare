require 'capistrano'
require 'capistrano/cloudflare/version'
require 'json'
require 'net/http'

module Capistrano
  module CloudFlare
    def self.send_request(options = {})
      uri = URI('https://www.cloudflare.com/api_json.html')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data({
        :v     => 1,
        :a     => 'fpurge_ts',
        :z     => options[:domain],
        :tkn   => options[:api_key],
        :email => options[:email]

      })
      response = JSON.parse(http.request(request).body)
    end
  end
end

load File.expand_path('../tasks/cloudflare.rake', __FILE__)
