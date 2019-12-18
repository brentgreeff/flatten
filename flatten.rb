require "roda"
require_relative './lib/flattener'

class Flatten < Roda
  plugin :render
  plugin :symbol_views
  plugin :partials, views: 'views'

  route do |r|
    # GET / request
    r.root do
      :home
    end

    r.get 'flatten' do
      @entered_array = r['entered_array']
      @flat_array = Flattener.new(@entered_array).to_s
      :home
    end
  end

  def page_title
    return "The flat array is: #{@flat_array}" if @flat_array
    'Welcome to the flattener'
  end
end
