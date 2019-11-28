class Admin::PublishersController < ApplicationController
  before_action :find_publisher, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  layout 'backend'

  def index
    @publishers = Publisher.all
  end

  def show
  end

  def new
    @publisher = Publisher.new
  end
  
  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      redirect_to admin_publishers_path, notice: '新增出版商成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params) 
      redirect_to edit_admin_publisher_path(@publisher), notice: '更新成功！'
    else
      render :edit
    end
  end

  def destroy
    @publisher.destroy
    redirect_to admin_publishers_path, notice: '刪除成功！'
  end

  private
  def find_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:name, :tel, :address, :online)
  end
end
