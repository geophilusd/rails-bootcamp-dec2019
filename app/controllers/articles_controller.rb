class ArticlesController < ApplicationController

	before_action :load_article, only: [:edit, :update, :show, :destroy]

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to article_path(@article)
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @article.update(article_params)
			redirect_to article_path(@article)
		else
			render :edit
		end
	end

	def index
		@articles = Article.all
	end

	def show
		
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private

		def load_article
			@article = Article.find_by(id: params[:id])
		end

		def article_params
			params[:article].permit(:title,:description)
		end

end