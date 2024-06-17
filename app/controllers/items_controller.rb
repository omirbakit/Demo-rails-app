class ItemsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  # before_action :authenticate_user!, only: [:users], unless: :admin_signed_in?
  # before_action :authenticate_admin!, only: [:admin]
  # before_action :set_collection!

  def index
    @collection = Collection.find(params[:collection_id])
    @item = @collection.items
  end

  def new
    @collection = Collection.find(params[:collection_id])
    # @items = @collection.items.new(item_params)
    # @item = Item.new
    # # @item = Item.new(item_params.merge(user: current_user))
    # @collection = Collection.find(params[:collection_id])
    # @item = @collection.items.new(item_params)
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @item = @collection.items.create(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "item has been created"
      redirect_to collection_items_path(@collection)
    else
      flash[:notice] = "item has not been created"
      redirect_to collection_path(@collection)
    end
  end

  def destroy
    @collection = Collection.find(params[:collection_id])
    @item = @collection.items.find(params[:id])
    @item.destroy
    redirect_to collection_items_path(@collection)
  end

  def show
    @collection = Collection.find(params[:id])
    @item = Item.find_by id: params[:id]
    # @user = User.find_by id: params[:id]
    # @collection.user = current_user
    # @collection.update(views: @collection.views + 1)
    @item = @collection.items.build
    @items = @collection.items
  end

  # def show
  #   @collection = Collection.find(params[:collection_id])
  #   @item = @collection.items.find(params[:id])
  #   # @user = User.find_by id: params[:id]
  #   # @collection.user = current_user
  #   # @collection.update(views: @collection.views + 1)

  #   @items = @collection.items
  # end

  # def index
  #   @collection = Collection.find(params[:collection_id])
  #   @item = @collection.items.find(params[:id])
  # end

  # def create
  #   @item = Item.new(item_params.merge(user: current_user))
  #   # @item = @collection.items.build(item_params.merge(user: current_user))

  #   if @item.save
  #     redirect_to collection_path(@collection)
  #   else
  #     render 'collections/show'
  #   end
  # end

  # def index
  #   @items = Item.order created_at: :desc
  # end

  private

  # def set_collection!
  #   @collection = Collection.find_by id: params[:id]
  # end

  def item_params
    params.require(:item).permit(:name, :tag)
  end
end