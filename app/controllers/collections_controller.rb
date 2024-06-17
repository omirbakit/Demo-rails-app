class CollectionsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  
  # before_action :authenticate_user!, only: [:users], unless: :admin_signed_in?
  # before_action :authenticate_admin!, only: [:admin]
  
  before_action :set_collection, only: %i[show]
  def new
    
  end

  def create
    @collection = Collection.new(collection_params.merge(user: current_user))

    if @collection.save
      redirect_to collections_path
    end
  end

  def show
    @collection = Collection.find(params[:id])
    @item = Item.find_by id: params[:created_at]
    # @user = User.find_by id: params[:id]
    # @collection.user = current_user
    # @collection.update(views: @collection.views + 1)
    # @item = @collection.items.build
    @items = @collection.items
  end

  def index
    @collections = Collection.all.order(created_at: :desc)
  end


  # def show
  #   @collection = Collection.find_by id: params[:id]

  #   @item = @collection.items.build
  # end

  # def index
  #   @collections = Collection.order(created_at: :desc)
  # end

  private

  def set_collection
    @collection = Collection.find_by id: params[:id]
  end

  def collection_params
    params.require(:collection).permit(:name, :description, :category)
  end
end