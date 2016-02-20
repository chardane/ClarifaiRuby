require 'httmultiparty'

require "clarifai_ruby/version"
require 'clarifai_ruby/configuration'
require 'clarifai_ruby/client'
require 'clarifai_ruby/info_request'
require 'clarifai_ruby/info_response'
require 'clarifai_ruby/color_request'
require 'clarifai_ruby/color_response'
require 'clarifai_ruby/token'
require 'clarifai_ruby/tag_request'
require 'clarifai_ruby/tag_response'
require 'clarifai_ruby/models/tag'
require 'clarifai_ruby/models/tag_image'


module ClarifaiRuby
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(configuration)
    @configuration = configuration
  end

  def self.configure
    yield configuration
  end
end
