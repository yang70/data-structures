class Array
  def merge_sort
    if self.length <= 1
      return self
    end

    middle = (self.length / 2).floor
    left = self.slice(0...middle).merge_sort
    right = self.slice(middle...self.length).merge_sort

    sorted = []

    while (left.length > 0) || (right.length > 0)
      if left.length == 0
        sorted << right
        return sorted.flatten
      elsif right.length == 0
        sorted << left
        return sorted.flatten
      else
        if left[0] <= right[0]
          sorted << left.shift
        elsif right[0] < left[0]
          sorted << right.shift
        end
      end
    end
    sorted
  end
end
