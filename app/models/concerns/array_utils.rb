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

  def split_array_into_batches(array, batch_length)
    counter = calculate_number_of_batches(array,batch_length)
    new_array = []
    x = 0
    while x < counter do
      start = x * batch_length
      ends = (x + 1) * batch_length
      new_array << array[start...ends]
      x+= 1
    end
    return new_array
  end

  def calculate_number_of_batches(array,batch_length)
    array.count.remainder(batch_length) != 0 ? (array.count / batch_length) + 1 : (array.count / batch_length)
  end
  
  def sort_by_median(items, price_key)
   sortedItem = items.sort { |a,b| a.price_median(price_key) <=> b.price_median(price_key)}
   return sortedItem.reverse()
  end

end