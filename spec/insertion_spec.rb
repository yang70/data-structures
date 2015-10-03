require 'minitest/spec'
require 'minitest/autorun'
require 'insertion'

describe "test that insertion is sorting correctly" do
  it "sorts an array correctly" do
    insertion = Insertion.new
    arr = [6, 5, 3, 1, 8, 7, 2, 4]
    insertion.sort(arr).must_equal [1, 2, 3, 4, 5, 6, 7, 8]
  end
end
