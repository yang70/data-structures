require 'minitest/spec'
require 'minitest/autorun'
require 'merge'

describe "merge sorts an array" do
  it "should sort an array" do
    arr = [1, 2, 3, 4, 5, 6, 7, 8].shuffle
    arr.merge.must_equal [1, 2, 3, 4, 5, 6, 7, 8]
  end

  it "benchmarks" do

  end
end
