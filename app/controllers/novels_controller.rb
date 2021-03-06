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
    if @novel.save
      flash[:notice] = "新增成功"
      redirect_to novels_path
    else
      flash[:alert] = "新增失敗"
      render "new"
    end
  end
  def show
    @page_title = @novel.name
  end
  def edit
  end
  def update
    if @novel.update(param_novel)
      flash[:notice] = "修改成功"
      redirect_to novels_path
    else
      flash[:alert] = "修改失敗"
      render "edit"
    end
  end
  def destroy
    @novel.destroy
    flash[:notice] = "刪除成功"
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

