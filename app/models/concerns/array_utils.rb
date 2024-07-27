module ArrayUtils
  def clear_zero(array)
    array.reject { |x| x == 0 }
  end

  def clear_doubles(array)
    return [] if array.empty?
    doubleLessArray = [array[0]]
    for value in array do
      doubleLessArray << value if doubleLessArray.last != value
    end
    return doubleLessArray
  end

  def sort_array(array)
    array.sort { |a,b| a <=> b}
  end

  def calculate_median(array)
    sorted_cleared_array =  sort_array(clear_doubles(clear_zero(array)))
    return 0 if sorted_cleared_array.empty?
    middle = (sorted_cleared_array.count / 2)
    sorted_cleared_array.count % 2 == 1 ? sorted_cleared_array[middle] : (sorted_cleared_array[middle - 1] + sorted_cleared_array[middle])/2
  end
end