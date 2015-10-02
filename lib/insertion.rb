class Insertion
  def sort(array)
    (1...array.length).each do |i|
      current = array[i]
      (i - 1).downto(0).each do |comp|
        if current >= array[comp]
          break
        elsif current < array[comp]
          array[comp + 1] = array[comp]
          array[comp] = current
        end
      end
    end
    array
  end
end


insertion = Insertion.new

arr = [6, 5, 3, 1, 8, 7, 2, 4]
arr2 = [4, 6, 3, 3, 8, 9, 1]
puts insertion.sort arr
puts "----"
puts insertion.sort arr2
