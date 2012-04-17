require 'capistrano'
require 'capistrano/cloudflare/version'

module Capistrano
  module CloudFlare
    def self.send_request(options = {})

    end

    def self.load_into(configuration)
      configuration.set :capistrano_cloudflare, self
      configuration.load do
        namespace :cloudflare do
          namespace :cache do
            desc "Purge the CloudFlare cache"
            task :purge do
              raise unless fetch(:cloudflare_options).respond_to?(:[])
              capistrano_cloudflare.send_request(cloudflare_options)
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
