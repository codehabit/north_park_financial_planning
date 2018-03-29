class Admin::ContentsController < ApplicationController
  def index
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.create(content_params)
    redirect_to admin_content_path(@content)
  end

  def show
    @content = Content.find(params[:id])
  end

  private

  def content_params
    params.require(:content).permit!
  end
end
