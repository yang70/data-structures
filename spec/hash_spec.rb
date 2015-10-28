require 'minitest/spec'
require 'minitest/autorun'
require 'hash_linked_list'
require 'hash_table'
require 'benchmark'


describe "test that hash table is working correctly" do
  it "should insert, retrieve, delete" do
    ht = HashTable.new(10)
    keys = %w(one two three four five)
    val = 1;
    keys.each{|key| ht.set(key, val); val += 1}
  end

  it "should be benchmarked" do

    word_hash_x_small = HashTable.new(10)
    word_hash_small   = HashTable.new(100)
    word_hash_medium  = HashTable.new(500)
    word_hash_large   = HashTable.new(1000)
    word_hash_x_large = HashTable.new(5000)

    words_array = []

    File.open("/usr/share/dict/words") do |file|
      file.each do |file|
        words_array << file.strip
      end
    end

    n = words_array.length - 1

    puts
    puts "*** Hash Table Benchmark ****************************"
    puts "Number of words: #{n}"
    Benchmark.bm(18) do |x|
      # x.report("X Small") { for i in 0..n; word_hash_x_small.set(words_array[i], words_array[i].reverse); end }
      # x.report("Small") { for i in 0..n; word_hash_small.set(words_array[i], words_array[i].reverse); end }
      # x.report("medium") { for i in 0..n; word_hash_medium.set(words_array[i], words_array[i].reverse); end }
      x.report("1,000 - Insert") { for i in 0..n; word_hash_large.set(words_array[i], words_array[i].reverse); end }
      x.report("1,000 - Retrieve") { for i in 0..n; word_hash_large.get(words_array[i]); end }
      x.report("5,000 - Insert") { for i in 0..n; word_hash_x_large.set(words_array[i], words_array[i].reverse); end }
      x.report("5,000 - Retrieve") { for i in 0..n; word_hash_x_large.get(words_array[i]); end }
    end
  end
end
