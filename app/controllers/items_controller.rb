class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: [:update, :edit, :destroy]
  
  def index
    @items = @list.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = @list.items.new(item_params)
    if @item.save 
      redirect_to user_list_path(@list.user_id, @list)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item = @list.items.update(item_params)
    if @item.save 
      redirect_to user_list_path(@list.user_id, @list)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to user_lists_path
  end

  private 

  def set_list
    @list = List.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:list_id])
  end

  def item_params
    params.require(:item).permit(:body)
  end

end
