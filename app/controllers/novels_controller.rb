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



  private
  def param_novel
    params.require(:novel).permit(:name, :genre, :description)
  end

end

