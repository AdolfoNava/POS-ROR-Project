class OptionsController < ApplicationController
  before_action :set_option, only: %i[ show edit update destroy ]

  # GET /options or /options.json
  def index
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
      {content: "Business Management", href: database_path},
      {content: "All Options", href: options_path},
    ]
    @o = Option.joins(:category).page(params[:page]).per(25).ransack(params[:q])
    @options = @o.result

    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  # GET /options/1 or /options/1.json
  def show
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
      {content: "Business Management", href: database_path},
      {content: "All Options", href: options_path},
      {content: "Option #{@option.name}", href: option_path(@option)},
    ]
  end

  # GET /options/new
  def new
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
      {content: "Business Management", href: database_path},
      {content: "All Options", href: options_path},
      {content: "New Option", href: new_option_path},
    ]
    @option = Option.new
  end

  # GET /options/1/edit
  def edit
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
      {content: "Business Management", href: database_path},
      {content: "All Options", href: options_path},
      {content: "Edit Option", href: edit_option_path},
    ]
  end

  # POST /options or /options.json
  def create
    @option = Option.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to option_url(@option), notice: "Option was successfully created." }
        format.json { render :show, status: :created, location: @option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /options/1 or /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to option_url(@option), notice: "Option was successfully updated." }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1 or /options/1.json
  def destroy
    @option.destroy!

    respond_to do |format|
      format.html { redirect_to options_url, notice: "Option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def option_params
      params.require(:option).permit(:base_price, :name, :category_id)
    end
end
