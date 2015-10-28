require 'minitest/spec'
require 'minitest/autorun'
require 'merge'
require 'benchmark'

describe "merge sorts an array" do
  it "should sort an array" do
    arr = [1, 2, 3, 4, 5, 6, 7, 8]
    random = arr.shuffle
    random.merge_sort.must_equal arr
  end

  it "benchmarks" do
    sorted = [*1..1000]
    reverse = sorted.reverse
    random = sorted.shuffle
    odd = []
    even = []
    i = 1_000

    (1..1000).each { |num| num.even? ? even << num : odd << num }

    worst = odd + even

    puts
    puts "********************************************************"
    puts "*** Merge sort, 1,000 element array, iterated #{i} times"
    Benchmark.bm(10) do |x|
      x.report("worst") { i.times do ; worst.merge_sort ; end }
      x.report("sorted") { i.times do ; sorted.merge_sort ; end }
      x.report("reverse") { i.times do ; reverse.merge_sort ; end }
      x.report("random") { i.times do ; random.merge_sort ; end }
    end
  end
end
