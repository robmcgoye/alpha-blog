class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # byebug
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 2)
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article]
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article created successfully"
      # redirect_to article_path(@article) same as below
      redirect_to @article      
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Saved Successfully"
      redirect_to @article
    else
      render 'edit'
    end 
  end 

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
