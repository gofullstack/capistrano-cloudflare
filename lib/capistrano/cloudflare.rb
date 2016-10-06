require 'capistrano'
require 'capistrano/cloudflare/version'
require 'json'
require 'httparty'
require 'rake'

module Capistrano
  module CloudFlare
    def self.send_request(options = {})
      zone = options[:zone]
      params =       {
        :purge_everything => true,
      }
      headers = {
        'Content-Type' => 'application/json',
        'X-Auth-Email' => options[:email],
        'X-Auth-Key' => options[:api_key]
      }

      resp = HTTParty.delete(
        "https://api.cloudflare.com/client/v4/zones/#{zone}/purge_cache",
        :body => params.to_json,
        :headers => headers
      )

      JSON.parse(resp.body)
    end
  end
end

load File.expand_path('../tasks/cloudflare.rake', __FILE__)
