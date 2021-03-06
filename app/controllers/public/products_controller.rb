class Public::ProductsController < ApplicationController

 def index
  @genres = Genre.all
  @products = Product.page(params[:page]).per(8)
  @allproducts = Product.all
 end

 def show
  @products = Product.all
  @product = Product.find(params[:id])
  @cart_product = CartProduct.new
 end

 private
	def product_params
		parmas.require(:product).permit(:image ,:name, :description, :tax_out_price, :is_sale,:genre_id)
	end
end
