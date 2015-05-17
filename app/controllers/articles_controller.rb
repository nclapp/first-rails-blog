class ArticlesController < ApplicationController

  def new

  end

  def create
    # render plain: params[:article].inspect
    # (this is a nice easy way to test, just prints params to screen)

    @article = Article.new(article_params)
    # @article = Article.new(params.require(:article).permit(:title, :text)) #for security ("strong parameters").
    # Refactored into private method below, and method called in line above (article_params replaced `params[:article]`).

    @article.save
    redirect_to @article # redirecting to `show` action
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end#ArticlesController class
