class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
      @cart = current_cart
  @categories = Category.all
    @orders = Order.all
    @orders2 = Order.where(:user_id => current_user.id)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
      @cart = current_cart
  @categories = Category.all
   @line_items = LineItem.where(:order_id => params[:id])
   respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(@order,view_context)
        send_data pdf.render, filename: "Order_#{@order.created_at.strftime("%d/%m/%Y")}.pdf", type: 'application/pdf'
      end
    end
  end

  # GET /orders/new
  def new
  @categories = Category.all
	@cart = current_cart
	if @cart.line_items.empty?
		redirect_to store_url, :notice => "Your cart is empty"
		return
	end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
          @cart = current_cart
  @categories = Category.all
  end

  # POST /orders
  # POST /orders.json
  def create
	 @cart = current_cart
  @categories = Category.all
    @order = Order.new(order_params)
	@order.add_line_items_from_cart(current_cart)
	@order.user_id = current_user.id
  @order.name = current_user.name
  @order.email = current_user.email

    respond_to do |format|
      if @order.save
		Cart.destroy(session[:cart_id])
		session[:cart_id] = nil
		format.html { redirect_to(root_path, :notice =>	'Thank you for your order.' ) }	
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :email, :name, :address, :pay_type, :created_at, :updated_at, :order_status)
    end
end
