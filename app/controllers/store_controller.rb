class StoreController < ApplicationController
  
  def index
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    @cart = current_cart
    @products = Product.all
  end
end
