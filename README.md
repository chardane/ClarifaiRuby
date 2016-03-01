# ClarifaiRuby

[![Build Status](https://travis-ci.org/chardane/ClarifaiRuby.svg?branch=master)](https://travis-ci.org/chardane/ClarifaiRuby)
[![Code Climate](https://codeclimate.com/github/chardane/ClarifaiRuby/badges/gpa.svg)](https://codeclimate.com/github/chardane/ClarifaiRuby)

Made with :heart:, from Prince Wilson and Charlyn Gonda (because they are awesome).

This gem is an unofficial Ruby client for Clarifai's image recognition API.

>The Clarifai API offers image and video recognition as a service. Whether you have one image or billions, you are only steps away from using artificial intelligence to 'see' what's inside your visual content.
>
>[*Clarifai*](http://newdocs.clarifai.com)

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
  - [InfoRequest](#inforequest)
  - [TagRequest](#tagrequest)
    - [Model](#model)
    - [Select Classes](#select-classes)
    - [Language](#language)
  - [ColorRequest](#colorrequest)
  - [FeedbackRequest](#feedbackrequest)
- [Known Issues](#known-issues)
- [Contributing](#contributing)
- [License](#license)

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
To make a `TagRequest`:
```ruby
tag_response = ClarifaiRuby::TagRequest.new.get("https://samples.clarifai.com/metro-north.jpg")
#=> #<ClarifaiRuby::TagResponse>

tag_response.tag_images
#=> [#<ClarifaiRuby::TagImage>]

# Each tag image will contain an array of Tag objects
tag_response.tag_images.first.tags
#=> [#<ClarifaiRuby::Tag>, #<ClarifaiRuby::Tag>, ...]
```

#### Model

You can pass in the `model` [(more info)](http://newdocs.clarifai.com/guide/tag#models)

>If you'd like to get tags for an image or video using a different model, you can do so by passing in a `model` parameter. If you omit this parameter, the API will use the default model for your application. You can change this on the applications page.

```ruby
tag_response = ClarifaiRuby::TagRequest.new.get("https://samples.clarifai.com/metro-north.jpg", model: "nsfw-v0.1")
#=> #<ClarifaiRuby::TagResponse>
```
As of February here are the valid models:

1. `general-v1.3`
2. `nsfw-v0.1`
3. `weddings-v1.0`

Please refer to the [documentation](http://newdocs.clarifai.com/guide/tag#models) for any possible changes to this list.

#### Select Classes

You can pass in `select_classes` [(more info)](http://newdocs.clarifai.com/guide/tag#select-classes)

>If you'd like to get the probability of a certain tag or tags, you can specify them in the request using the `select_classes` parameter. Different tags should be comma separated.

```ruby
tag_response = ClarifaiRuby::TagRequest.new.get("https://samples.clarifai.com/metro-north.jpg", select_classes: "light,sky")
#=> #<ClarifaiRuby::TagResponse>
```

#### Language

You can pass in `language` [(more info)](http://newdocs.clarifai.com/guide/tag#languages)

> By default this API call returns tags in English. You can change this default setting on the applications page or can pass in a language parameter. If you use a language other than English, you must make sure the model you are using is `general-v1.3`.

```ruby
tag_response = tag_response = ClarifaiRuby::TagRequest.new.get("https://samples.clarifai.com/metro-north.jpg", model: "general-v1.3", language: "es")
#=> #<ClarifaiRuby::TagResponse>
```

### ColorRequest
**Pending**
### FeedbackRequest
**Pending**

## Known Issues
- [ ] **Token Overconsumption**
  - Currently, every instance of any request objects generates a separate access token. We would need to change it, such that it would use one token across all request objects.
- [ ] **No support for multiple files**
  - The `tag` endpoint can support multiple files within its request, however, due to `HTTMultiParty` gem limitations.Â

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chardane/ClarifaiRuby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
