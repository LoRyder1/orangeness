class ArticlesController < ApplicationController

  before_filter :find_article, :except => [:index, :new]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  protected

  def find_article
    if id = Slug[params[:id]]
      @article = Article.find(id)
    else
      @article = Article.find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
