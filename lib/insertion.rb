class Insertion
  def sort(array)
    (1...array.length).each do |index|
      current = array[index]
      (index - 1).downto(0).each do |comp|
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
