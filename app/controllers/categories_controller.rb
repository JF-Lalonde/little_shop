class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "#{@category.name} added!"

      redirect_to "/#{@category.name}"
    else
      render :new
    end
  end

  def show
    @category = Category.find_by(name: params[:category_name])
    if @category
      @product = @category.products
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Category #{@category.name} updated!"
      redirect_to ("/#{@category.name}")
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
