class NovelsController < ApplicationController
  before_action :id_find, :only => [:show, :edit, :update, :destroy]
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
    @page_title = @novel.name
  end
  def edit
  end
  def update
    @novel.update(param_novel)
    redirect_to novels_path
  end
  def destroy
    @novel.destroy
    redirect_to novels_path
  end

  private
  def id_find
    @novel = Novel.find(params[:id])
  end
  def param_novel
    params.require(:novel).permit(:name, :genre, :description)
  end

end

