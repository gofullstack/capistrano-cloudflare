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

    def self.load_into(configuration)
      configuration.set :capistrano_cloudflare, self
      configuration.load do
        namespace :cloudflare do
          namespace :cache do
            desc "Purge the CloudFlare cache"
            task :purge do
              raise unless fetch(:cloudflare_options).respond_to?(:[])
              response = capistrano_cloudflare.send_request(cloudflare_options)
              if response['result'] == 'success'
                logger.info("Purged CloudFlare cache for #{cloudflare_options[:domain]}")
              else
                logger.error("CloudFlare cache purge failed. Reason: #{response['msg'] || 'unknown'}")
              end
            end
          end
        end

      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::CloudFlare.load_into(Capistrano::Configuration.instance)
end
