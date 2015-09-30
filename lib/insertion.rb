class Insertion
  def sort(array)
    (1...array.length).each do |index|
      current = array[index]
      # puts "Current: #{current}"
      (index - 1).downto(0) do |search|
        if current >= array[search]
          array[index] = current
          break
        elsif current < array[search]
          array[index] = array[search]
        end
        # puts array[search]
      end
    end
    array
  end
end


# insertion = Insertion.new

# arr = [6, 5, 3, 1, 8, 7, 2, 4]

# puts insertion.sort arr
