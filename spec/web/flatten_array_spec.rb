require_relative 'spec_helper'

describe "Flattening arrays" do
  include Capybara::DSL

  it "Flatten an array with a single nested array" do
    visit '/'

    assert page.has_text?('Welcome to the flattener')

    fill_in 'Enter an array that u want to flatten', with: '[1,2,3],4'
    click_button 'Flatten'

    assert page.has_text?('The flat array is: ["1", "2", "3", "4"]')
  end

  # TODO: We need to add tests for what to do when a non-integer is entered

  # TODO: We need to check what to do when the array entered is not recognised as an array
end
