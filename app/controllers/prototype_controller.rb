class PrototypeController < ApplicationController
  before_action :set_user_variable
  
  def index
  end

  private
  def set_user_variable
    @user = User.new
  end

end
