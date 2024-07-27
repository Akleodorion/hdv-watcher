class Item < ApplicationRecord
  include ArrayUtils

  def isWorth
    condition1 = calculate_median(unit_price) > (unit_price.last + calculate_median(unit_price) * 0.02)
    condition2 = calculate_median(tenth_price) > (tenth_price.last + calculate_median(tenth_price) * 0.02)
    condition3 = calculate_median(hundred_price) > (hundred_price.last + calculate_median(hundred_price) * 0.02)
    return condition1 || condition2 || condition3
  end
end
  