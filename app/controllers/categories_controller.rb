class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
      @cart = current_cart
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
      @cart = current_cart
  @categories = Category.all
	@categories = Category.all
	@products = Product.where(:category_id => params[:id])
  @product_images = ProductImage.all
  end

  # GET /categories/new
  def new
      @cart = current_cart
  @categories = Category.all
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
      @cart = current_cart
  @categories = Category.all
  end

  # POST /categories
  # POST /categories.json
  def create
      @cart = current_cart
  @categories = Category.all
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
      @cart = current_cart
  @categories = Category.all
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
      @cart = current_cart
  @categories = Category.all
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :created_at)
    end
end
