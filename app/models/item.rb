class Item < ApplicationRecord
  include ArrayUtils

  def isWorth
    condition1 = calculate_median(unit_price) > (unit_price.last + calculate_median(unit_price) * 0.02)
    condition2 = calculate_median(tenth_price) > (tenth_price.last + calculate_median(tenth_price) * 0.02)
    condition3 = calculate_median(hundred_price) > (hundred_price.last + calculate_median(hundred_price) * 0.02)
    return condition1 || condition2 || condition3
  end

  def price_type_is_worth(price_type)
    price_type_map = {"unit_price": unit_price,"tenth_price": tenth_price,"hundred_price": hundred_price}
  
    return calculate_median(price_type_map[price_type.to_sym]) > (price_type_map[price_type.to_sym].last + calculate_median(price_type_map[price_type.to_sym]) * 0.02 )
  end

  def price_median(price_type)
    price_type_map = {"unit_price": unit_price,"tenth_price": tenth_price,"hundred_price": hundred_price}
    calculate_median(price_type_map[price_type.to_sym])
  end
 
 

end
  