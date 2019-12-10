class Admin::BaseController < ApplicationController
  before_action :permission_check!
  before_action :authenticate_user!
  layout 'backend'

  private
  def permission_check!
    redirect_to root_path, notice: '無法存取' if user_signed_in? && current_user.role != 'admin'
  end
end
