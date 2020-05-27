class ListsController < ApplicationController
  before_action :set_user
  before_action :set_list,  only: [:show, :update, :edit, :destroy]

  def index
    @lists = @user.lists
  end

  def show
  end

  def new
    @list = @user.lists.new
  end

  def create
    @list = @user.lists.new(list_params)

    if @list.save
      redirect_to [@user, @list]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to [@user, @list]
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to user_lists_path
  end

  private
  
    def set_user
      @user = User.find(params[:user_id])
    end 

    def set_list
      @list = List.find(params[:id])
    end 

    def list_params
      params.require(:list).permit(:title)
    end
end