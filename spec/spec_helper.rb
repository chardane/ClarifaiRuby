$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'clarifai_ruby'
require 'pry'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

ClarifaiRuby.configure do |config|
  config.base_url = 'https://api.clarifai.com'
  config.version_path = "/v1"
  config.client_id = "-GMMA7LUQQ_xKYRWQDgIosC2U6JNusO7R7neDIJy"
  config.client_secret = "VPH8lyZjE9BhnztcvXeGWRA_OUEfckFBt4sgWqXj"
end
