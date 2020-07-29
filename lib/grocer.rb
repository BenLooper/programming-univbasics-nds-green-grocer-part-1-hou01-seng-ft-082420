require 'pry'

def find_item_by_name_in_collection(name, collection)
  collection.each do |item_hash|
    if item_hash.value? name
      return item_hash
    end
  end
  return nil
end

def consolidate_cart(cart)

  consolidated_cart = cart.each_with_object([]) do |shopping_cart_hash, checkout_cart|
    unless checkout_cart == [] 
      checkout_list = []
      checkout_list.append shopping_cart_hash[:item]
      binding.pry
      checkout_cart.each do |checkout_cart_hash|
          if checkout_cart_hash[:item] == shopping_cart_hash[:item]
             checkout_cart_hash[:count] += 1
          elsif 
            shopping_cart_hash[:count] = 1
            checkout_cart.append shopping_cart_hash
          end
      end
    else  
      shopping_cart_hash[:count] = 1
      checkout_cart.append shopping_cart_hash
    end
  end 
  consolidated_cart
end