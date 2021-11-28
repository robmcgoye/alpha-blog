class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end
  
  def show
    @category = Category.find(params[:id])
  end

  def index
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created successfully"
      # redirect_to article_path(@article) same as below
      redirect_to @category      
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end