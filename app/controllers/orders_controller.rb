class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show payment edit update destroy ]

  # GET /orders or /orders.json
  def index
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
      {content: "All orders", href: :index},
    ]
    @orders = Order.page(params[:page]).per(10)
  end

  # GET /orders/1 or /orders/1.json
  def show
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
      {content: "All Orders", href: orders_path},
      {content: "Showing Order", href: payment_url(@order.id)},
    ]
  end
  def payment
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
      {content: "All Orders", href: orders_path},
      {content: "Paying for Order", href: payment_url(@order.id)},
    ]
  end
  # GET /orders/new
  def new
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
      {content: "New Order", href: "#"},
    ]
    @c = Customer.ransack(params[:q]) 
    @customers = @c.result 
    respond_to do |format|
      format.html {  render :new }  # Render the index page, you can customize this if needed
      format.js 
    end

  end
  def chosen
    @order = Order.new
    @options = Option.all
    @new = true
  end
  # GET /orders/1/edit
  def edit
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
      {content: "Edit Order", href: order_url(@order)},
    ]
    @options = Option.all
    @all_options = Order.statuses
    @excluded_keys = ["created", "completed"] 
    @filtered_options = @all_options.reject { |_, v| @excluded_keys.include?(v) }
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    if Order.all.last.id != nil
      id = Order.all.last.id
    else
      id = 0
    end
    
    @order.items.each do |item|
      item.order_id = id + 1
    end
    respond_to do |format|
      if @order.save
        format.html { redirect_to main_path, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        @options = Option.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order)
            .permit(:price,
                    :due_date,
                    :customer_id,
                    :employee_id,
                    :payment_method,
                    :status,
                    :pre_paid,
                    :items_count,
                    items_attributes: [:id, :quantity, :price, :name, :option_id])


    end
end
