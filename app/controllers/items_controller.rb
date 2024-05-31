class ItemsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_collection!

  def new
    # @item = Item.new(item_params.merge(user: current_user))
  end

  def create
    @item = Item.new(item_params.merge(user: current_user))
    # @item = @collection.items.build(item_params.merge(user: current_user))

    if @item.save
      redirect_to collection_path(@collection)
    else
      render 'collections/show'
    end
  end

  def index
    @items = Item.order created_at: :desc
  end

  private

  def set_collection!
    @collection = Collection.find_by id: params[:id]
  end

  def item_params
    params.require(:item).permit(:name, :tag)
  end
end