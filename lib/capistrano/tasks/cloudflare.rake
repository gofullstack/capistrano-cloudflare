namespace :cloudflare do
  namespace :cache do
    desc "Purge the CloudFlare cache"
    task :purge do
      run_locally do
        raise 'Missing CloudFlare configuration.' unless fetch(:cloudflare_options).respond_to?(:[])
        response = Capistrano::CloudFlare.send_request(fetch(:cloudflare_options))
        if response['success']
          info "Purged CloudFlare cache for #{fetch(:cloudflare_options)[:zone]}"
        else
          error "CloudFlare cache purge failed. Reason: #{response['errors'].first['message'] || 'unknown.'}"
        end
      end
    end
  end
end
