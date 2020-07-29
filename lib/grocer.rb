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
  
  checkout_list = []
  consolidated_cart = cart.each_with_object([]) do |shopping_cart_hash, checkout_cart|
    unless checkout_cart == [] 
      if checkout_list.include? shopping_cart_hash[:item]
        checkout_cart.each do |checkout_cart_hash|
          if checkout_cart_hash[:item] == shopping_cart_hash[:item]
             checkout_cart_hash[:count] += 1
          end 
        end 
      else 
        checkout_list.append shopping_cart_hash[:item]
        shopping_cart_hash[:count] = 1
        checkout_cart.append shopping_cart_hash
      end    
    else  
      shopping_cart_hash[:count] = 1
      checkout_cart.append shopping_cart_hash
    end
  end 
  binding.pry 
  consolidated_cart
end