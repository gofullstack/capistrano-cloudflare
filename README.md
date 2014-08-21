# Capistrano CloudFlare [![Build Status](https://secure.travis-ci.org/cramerdev/capistrano-cloudflare.png)](https://secure.travis-ci.org/cramerdev/capistrano-cloudflare)

[CloudFlare](http://www.cloudflare.com/) is a service that protects and speeds up websites. Capistrano Cloudflare provides [Capistrano](https://github.com/capistrano/capistrano/wiki/Documentation-v2.x) tasks to update your CloudFlare settings.

Capistrano CloudFlare Version 1.0 and above supports the new Capistrano v3 API. For compatbility with Capistrano v2, please use version `0.0.2`.

Currently only cache purging is supported.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-cloudflare'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-cloudflare

## Usage

When using Capistrano, add:

    require 'capistrano/cloudflare'

    set :cloudflare_options, {
        :domain  => 'example.com',
        :email   => 'me@example.com',
        :api_key => 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
    }

to config/deploy.rb. These options can be found in your [CloudFlare account seetings](https://www.cloudflare.com/my-account).

The following Capistrano tasks should now be available:

* `cloudflare:cache:purge`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The MIT License (MIT)
Copyright (c) 2012 Cramer Development, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
