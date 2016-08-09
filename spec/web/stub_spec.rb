require_relative 'spec_helper'

describe "Flattening arrays" do
  include Capybara::DSL

  it "Viewing the homepage" do
    visit '/'

    assert page.has_text?('Welcome to the flattener')
  end
end
