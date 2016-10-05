require 'capistrano'
require 'capistrano/cloudflare/version'
require 'json'
require 'net/http'
require 'rake'

module Capistrano
  module CloudFlare
    def self.send_request(options = {})
      zone = options[:zone]
      uri = URI("https://api.cloudflare.com/client/v4/zones/#{zone}/purge_cache")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Delete.new(uri.request_uri)
      request['X-Auth-Email'] = options[:email]
      request['X-Auth-Key'] = options[:api_key]


      request.set_form_data({
        :purge_everything => true,
      })
      response = JSON.parse(http.request(request).body)
    end
  end
end

load File.expand_path('../tasks/cloudflare.rake', __FILE__)
