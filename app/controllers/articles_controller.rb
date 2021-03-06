# A frequent practice is to place the standard CRUD actions in each controller in the following order:
# index, show, new, edit, create, update, and destroy.

class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "natty", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end


  def new
    @article = Article.new
    # added this after adding if save? functionality
  end


  def edit
    @article = Article.find(params[:id])
  end


  def create
    # render plain: params[:article].inspect
    # (this is a nice easy way to test, just prints params to screen)

    @article = Article.new(article_params)
    # @article = Article.new(params.require(:article).permit(:title, :text)) #for security ("strong parameters").
    # Refactored into private method below, and method called in line above (article_params replaced `params[:article]`).

    if @article.save
      redirect_to @article
      # redirecting to `show` action
    else
      render 'new'
      # goes to #new action above if it's unable to save. Render is in same request, as opposed to redirect_to which issues a new request.
    end
  end#create method


  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end#ArticlesController class
