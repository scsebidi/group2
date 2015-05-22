class HomeController < ApplicationController
  def index
    @users = User.all
    @products = Product.all
	@product_images = ProductImage.all
	
	@cart = current_cart
	@categories = Category.all
  end
end
