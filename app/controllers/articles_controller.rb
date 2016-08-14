class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "pavans", password: "saisadan", except: [:index, :show]

  def index
  	@articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  end

  def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def create
#  	render plain: params[:article].inspect
	@article = Article.new(article_params)

	@article.save
	if @article.save
		redirect_to @article
	else
		render 'new'
	end
  end

  def update
	@article = Article.find(params[:id])

    if @article.update(article_params)
    	redirect_to @article
  	else
    	render 'edit'
  	end
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  

end
