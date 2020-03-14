class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end
  
  def crawl
    require 'nokogiri'
    require 'open-uri'
    require 'byebug'
    doc = Nokogiri::HTML(open('https://akhbarak.net/sections/Egypt'))
    links = doc.css("h4.media-heading a").map{|l| l['href']}
    titles = doc.xpath("//h4/a").map{|t|t.text}
    #saving scraped data in our database
    links.each_with_index do |l,i|             
       Article.create!(title: titles[i], url: "https://akhbarak.net"+links[i], image_url: "hhtt" )
    end 

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :image_url, :url)
    end
end
