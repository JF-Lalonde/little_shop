class CategoriesController < ApplicationController

  def new

  end

  def create 
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "#{@category.name} added!"  
   
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end

