require 'spec_helper'

describe Capistrano::CloudFlare do
  before do
    @configuration = Capistrano::Configuration.new
    Capistrano::CloudFlare.load_into(@configuration)
    @options = { :domain_name => 'example.com',
                 :email       => 'me@example.com',
                 :api_key     => 'F' }
  end

  it { described_class.should be_a Module }

  specify 'cloudflare:cache:purge' do
    @configuration.find_task('cloudflare:cache:purge').should_not == nil
    expect { @configuration.find_and_execute_task('cloudflare:cache:purge') }.to raise_error

    @configuration.set(:cloudflare_options, @options)
    expect { @configuration.find_and_execute_task('cloudflare:cache:purge') }.to_not raise_error
  end

  specify 'send_request' do
    described_class.send_request(@options)
  end
end
