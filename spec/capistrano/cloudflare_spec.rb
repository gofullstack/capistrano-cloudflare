require 'spec_helper'

describe Capistrano::CloudFlare do
  it { should be_a Module }

  describe '.send_request' do
    it 'should call out to the cloudflare API and return the response body as a hash' do
      options = {
        zone:   'Z',
        email:    'me@example.com',
        api_key:  'F'
      }

      body = { 'success' => true }
      stub_request(:delete, "https://api.cloudflare.com/client/v4/zones/Z/purge_cache").to_return(
        :status => 200, :body => body.to_json
      )

      Capistrano::CloudFlare.send_request(options)['success'].should eq(true)
    end
  end
end
