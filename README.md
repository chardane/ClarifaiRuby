# ClarifaiRuby

Made with :heart:, from Prince Wilson and Charlyn Gonda (because they are awesome).

This gem is an unofficial Ruby client for Clarifai's image recognition API.

>The Clarifai API offers image and video recognition as a service. Whether you have one image or billions, you are only steps away from using artificial intelligence to 'see' what's inside your visual content.
>
>[*Clarifai*](http://newdocs.clarifai.com)

## Prerequisites
Before using this gem, make sure to [create an account for Clarifai](https://developer.clarifai.com/accounts/signup/) and create an application to obtain a client id and client secret.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clarifai_ruby'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install clarifai_ruby
```

## Configuration
To configure the gem, stick this block:
```ruby
ClarifaiRuby.configure do |config|
  config.base_url       = "https://api.clarifai.com"
  config.version_path   = "/v1"
  config.client_id      = "<CLIENT_ID>"
  config.client_secret  = "<CLIENT_SECRET>"
end
```
inside of your initializer file.

## Usage

This gem can make 4 types of requests (Info, Tag, Color, Feedback) using 4 corresponding request objects:
- `InfoRequest`
- `TagRequest`
- `ColorRequest`
- `FeedbackRequest`

And each request will result in a corresponding response object that will have access to each response's data:
- `InfoResponse`
- `TagResponse`
- `ColorResponse`
- `FeedbackResponse`

### InfoRequest
To make an `InfoRequest`:
```ruby
info = ClarifaiRuby::InfoRequest.new.get
#=> ClarifaiRuby::InfoResponse

info.status_code
#=> "OK"
```
### TagRequest
**Pending**
### ColorRequest
**Pending**
### FeedbackRequest
**Pending**

## Known Issues
- Token Overconsumption
  - Currently, every instance of any request objects generates a separate access token. We would need to change it, such that it would use one token across all request objects.
- No support for multiple files
  - The `tag` endpoint can support multiple files within its request, however, due to `HTTMultiParty`gem limitations.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chardane/ClarifaiRuby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
