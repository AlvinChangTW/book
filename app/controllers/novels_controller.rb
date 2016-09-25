class NovelsController < ApplicationController
  def index
    @novels = Novel.all
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
  end
  def edit
    @novel = Novel.find(params[:id])
  end
  def update
    @novel = Novel.find(params[:id])
    @novel.update(param_novel)
    redirect_to novels_path
  end

  private
  def param_novel
    params.require(:novel).permit(:name, :genre, :description)
  end

end

