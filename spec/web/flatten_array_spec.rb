require_relative 'spec_helper'

describe "Flattening arrays" do
  include Capybara::DSL

  it "Flatten an array with a single nested array" do
    visit '/'

    assert page.has_text?('Welcome to the flattener')

    fill_in 'Enter an array that u want to flatten', with: '[1,2,3],4'
    click_button 'Flatten'

    assert page.has_text?('The flat array is: [1, 2, 3, 4]')

    fill_in 'Enter an array that u want to flatten', with: '[1,[cabbage,[3]]'
    click_button 'Flatten'

    assert page.has_text?('The flat array is: [1, cabbage, 3]')
  end
end
