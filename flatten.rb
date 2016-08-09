require "roda"

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
      @flat_array = @entered_array.delete('[]').split(",")
      :home
    end
  end

  def page_title
    return "The flat array is: #{@flat_array}" if @flat_array
    'Welcome to the flattener'
  end
end
