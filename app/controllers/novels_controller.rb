class NovelsController < ApplicationController
  def index
    @novels = Novel.page(params[:page]).per(5)
  end
  def new
    @novel = Novel.new
  end
  def create
    @novel = Novel.new(param_novel)
    @novel.save
    redirect_to novels_path
  end
  def show
    @novel = Novel.find(params[:id])
    @page_title = @novel.name
  end
  def edit
    @novel = Novel.find(params[:id])
  end
  def update
    @novel = Novel.find(params[:id])
    @novel.update(param_novel)
    redirect_to novels_path
  end
  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    redirect_to novels_path
  end

  private
  def param_novel
    params.require(:novel).permit(:name, :genre, :description)
  end

end

