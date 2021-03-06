class Admin::NewsController < AdminController

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(news_params)
      flash[:success] = "News updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.save
      flash[:info] = "News has been added"
      redirect_to root_url
    else
      @news.errors.full_messages
      render 'new'
    end
  end

  def index
    @news = News.paginate(page: params[:page])
  end

  def show
    @news = News.find(params[:id])
  end

  private

  def news_params
    params.require(:news).permit(:text, :title)
  end
end