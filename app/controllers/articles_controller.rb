class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end
  def show
  end
  def new
    @article = Article.new
  end
  def create
    @articles = Article.new(article_params)
    @articles.save
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy

    # si lo comento , aún se pinta luego de eliminado, otra forma q no sea redirect?
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
