class PrototypesController < ApplicationController
  before_action :set_user_variable
  before_action :authenticate_user! , only: [:new , :create , :edit , :update , :destroy]
  before_action :move_to_index , only: [:edit] 
    

  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private

  def move_to_index
    @prototype = Prototype.find(params[:id])
    if @prototype.user.id != current_user.id 
      redirect_to action: :index
    end
  end

  def set_user_variable
    @user = User.new
  end

  def prototype_params
    params.require(:prototype).permit(:title , :catch_copy , :concept , :image , :user).merge(user_id: current_user.id)
  end

end
