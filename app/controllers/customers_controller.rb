# Customer Integration
class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  # GET /customers or /customers.json
  def index
    @breadcrumbs = [
      { content: 'Main Menu', href: main_path },
      { content: 'Business Management', href: database_path },
      { content: 'All Customers', href: customers_path }
    ]
    @customers = Customer.joins(:orders).page(params[:page]).per(10)
  end

  # GET /customers/1 or /customers/1.json
  def show; end

  # GET /customers/new
  def new
    @breadcrumbs = [
      { content: 'Main Menu', href: main_path },
      { content: 'New Customer', href: :new }
    ]
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @breadcrumbs = [
      { content: 'Main Menu', href: main_path },
      { content: 'Database', href: datebase_path },
      { content: 'All Customers', href: :index },
      { content: 'New Customer', href: :edit }
    ]
  end

  # POST /customers or /customers.json
  def create # rubocop:disable Metrics/MethodLength
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html do
          redirect_to returning_customer_order_url(@customer), notice: 'Customer was successfully created.'
        end
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_path, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy!

    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:phone_number, :email, :last_name, :first_name, :address, :orders_count)
  end
end
