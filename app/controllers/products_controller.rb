class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  impressionist actions: [:show], unique: [:session_hash]

  # GET /products
  # GET /products.json
  def index
    if params[:search]
    @products = Product.search(params[:search]).order("created_at DESC")
    else 
    @products = Product.order(params[:sort])
    end
     @cart = current_cart
	@categories = Category.all
  @product_images = ProductImage.all
  end

  # GET /products/1
  # GET /products/1.json
  def show

	@product_image = @product.product_image
	@categories = Category.all
     @cart = current_cart
      @reviews = Review.where(:product_id => params[:id])
     @review = Review.new

  end

  # GET /products/new
  def new
      @categories = Category.all
    @product = Product.new
     @cart = current_cart
  end

  # GET /products/1/edit
  def edit
      @categories = Category.all
     @cart = current_cart
  end

  # POST /products
  # POST /products.json
  def create
      @categories = Category.all
     @cart = current_cart
    @product = Product.new(product_params)
    @product_images = ProductImage.all
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
     @categories = Category.all
     @cart = current_cart
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
     @categories = Category.all
     @cart = current_cart
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :unit_price, :quantity, :manufacturer_id, :category_id, :created_at, :updated_at, :views, :available_size, :available_color, :quantity_sold)
    end
end
