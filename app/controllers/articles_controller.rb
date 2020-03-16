class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.page(page).per(per_page)

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

    CrawlAkhbarakJob.perform_later


  end



  private

    def page
      @page ||= params[:page] || 1
    end

    def per_page
      @per_page ||=params[:per_page] || 10
    end
    
    def set_pagination_headers(v_name)
      pc = instance_variable_get("@#{v_name}")
      
      headers["X-Total-Count"] = pc.total_count

      links = []
      links << page_link(1, "first") unless pc.first_page?
      links << page_link(pc.prev_page, "prev") if pc.prev_page
      links << page_link(pc.next_page, "next") if pc.next_page
      links << page_link(pc.total_pages, "last") unless pc.last_page?
      headers["Link"] = links.join(", ") if links.present?
    end

    def page_link(page, rel)
      # "<#{posts_url(request.query_parameters.merge(page: page))}>; rel='#{rel}'"
      base_uri = request.url.split("?").first
      "<#{base_uri}?#{request.query_parameters.merge(page: page).to_param}>; rel='#{rel}'"
    end    




    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :image_url, :url)
    end
    
    

end
