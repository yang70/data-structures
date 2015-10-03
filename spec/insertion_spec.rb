require 'minitest/spec'
require 'minitest/autorun'
require 'insertion'
require 'benchmark'

describe "test that insertion is sorting correctly" do
  insertion = Insertion.new

  it "sorts an array correctly" do
    arr = [6, 5, 3, 1, 8, 7, 2, 4]
    insertion.sort(arr).must_equal [1, 2, 3, 4, 5, 6, 7, 8]
    arr = [5, 5, 4, 4, 8, 6, 2, 2, 1]
    insertion.sort(arr).must_equal [1, 2, 2, 4, 4, 5, 5, 6, 8]
  end

  it "benchmarks for insertion" do
    i = 100_000
    sorted  = [*1..20]
    reverse = [*20..1]
    random  = [*1..20].shuffle

    Benchmark.bmbm(10) do |x|
      x.report("Sorted") { i.times do ; insertion.sort sorted ; end }
      x.report("Reverse") { i.times do ; insertion.sort reverse ; end }
      x.report("Random") { i.times do ; insertion.sort random ; end }
    end
  end
end
