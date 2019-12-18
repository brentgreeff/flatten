require "minitest/autorun"
require_relative "../../lib/flattener"

describe Flattener do

  describe "When passed a nested array of integers" do

    it "flattens and casts" do
      _( flatten('[ 1, [ 2, [ 3 ] ], 4 ]') ).must_equal [ 1, 2, 3, 4 ]
    end
  end

  describe "When passed a nested array of strings" do

    it "flattens and casts" do
      _( flatten('[ a, [ b, [ c ] ], dolphin ]') ).must_equal [ 'a', 'b', 'c', 'dolphin' ]
    end
  end

  describe "When passed elements with spaces in them" do

    it 'flattens correctly' do
      _( flatten('[ [1], 5 trees, [2] ]') ).must_equal [1, '5 trees', 2]
    end
  end

  def flatten(input)
    Flattener.new(input).perform
  end
end
