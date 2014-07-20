# FastAttributes::UUID
[![Gem Version](http://img.shields.io/gem/v/fast_attributes-uuid.svg)](http://rubygems.org/gems/fast_attributes-uuid)
[![Build Status](http://img.shields.io/travis/applift/fast_attributes-uuid.svg)](https://travis-ci.org/applift/fast_attributes-uuid)
[![Coverage Status](http://img.shields.io/coveralls/applift/fast_attributes-uuid.svg)](https://coveralls.io/r/applift/fast_attributes-uuid?branch=master)
[![Code Climate](http://img.shields.io/codeclimate/github/applift/fast_attributes-uuid.svg)](https://codeclimate.com/github/applift/fast_attributes-uuid)
[![Dependency Status](http://img.shields.io/gemnasium/applift/fast_attributes-uuid.svg)](https://gemnasium.com/applift/fast_attributes-uuid)

## Overview
This gem adds support of `UUID` type to `fast_attributes` gem

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'fast_attributes'
gem 'fast_attributes-uuid'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install fast_attributes fast_attributes-uuid
```

## Usage

```ruby
require 'fast_attributes'
require 'fast_attributes/uuid'

class Request
  extend FastAttributes
  attribute :id, UUIDTools::UUID
end

request = Request.new
request.id = '479c4718-06d0-4712-b79d-eea7170938c8'
# => #<UUID:0x3ff8a1a0a684 UUID:479c4718-06d0-4712-b79d-eea7170938c8> 

request.id = 'EFC0CCF6E72243958306D816AB82BAB7'
# => #<UUID:0x3ff8a19db924 UUID:efc0ccf6-e722-4395-8306-d816ab82bab7>

request.id = UUIDTools::UUID.parse('4e79aff3-1f04-4fea-bebf-694625551a92')
# => #<UUID:0x3ff8a19c3d24 UUID:4e79aff3-1f04-4fea-bebf-694625551a92>
```

## Contributing

1. Fork it ( https://github.com/applift/fast_attributes-uuid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
