require 'spec_helper'

describe ClarifaiRuby do
  it 'has a version number' do
    expect(ClarifaiRuby::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(ClarifaiRuby.hello_world).to eq "yo, boo"
  end
end
