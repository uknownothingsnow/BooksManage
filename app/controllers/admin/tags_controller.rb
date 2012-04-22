class Admin::TagsController < Admin::ApplicationController
  def index
    @tags = Tag.page(params[:page]).per(10)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to admin_tags_url
    else
      render :action => :new
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_url
  end
end
