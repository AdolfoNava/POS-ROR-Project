# Categories Controller
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @breadcrumbs = [
      { content: 'Main Menu', href: main_path },
      { content: 'Business Management', href: database_path },
      { content: 'All Categories', href: categories_path }
    ]
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
    @breadcrumbs = [
      { content: 'Main Menu', href: main_path },
      { content: 'Business Management', href: database_path },
      { content: 'All Categories', href: categories_path },
      { content: "Category #{@category.name}", href: category_path(@category) }
    ]
  end

  # GET /categories/new
  def new
    @breadcrumbs = [
      { content: 'Main Menu', href: main_path },
      { content: 'Business Management', href: database_path },
      { content: 'All Categories', href: categories_path },
      { content: 'New Category', href: new_category_path }
    ]
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @breadcrumbs = [
      { content: 'Main Menu', href: main_path },
      { content: 'Business Management', href: database_path },
      { content: 'All Categories', href: categories_path },
      { content: "Edit Category #{@category.name}", href: edit_category_path(@category) }
    ]
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
