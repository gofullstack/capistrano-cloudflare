require 'spec_helper'

describe Capistrano::CloudFlare do
  it { should be_a Module }

  describe '.send_request' do
    it 'should POST to the cloudflare API and return the response body as a hash' do
      options = {
        domain:   'example.com',
        email:    'me@example.com',
        api_key:  'F'
      }

      body = { 'result' => 'success' }
      stub_request(:post, 'https://www.cloudflare.com/api_json.html').to_return(
        :status => 200, :body => body.to_json
      )

      Capistrano::CloudFlare.send_request(options).should eq(body)
    end
  end
end
