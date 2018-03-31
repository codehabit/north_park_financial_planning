class Admin::ContentsController < ApplicationController
  before_action :check_admin!

  def index
    @contents = Content.all
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

  def check_admin!
    redirect_to home_path unless admin_signed_in?
  end
end
