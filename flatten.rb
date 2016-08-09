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
  end
end
