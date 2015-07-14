class RegistryItemsController < ApplicationController
  def index
    @registry_items = RegistryItem.all
    render json: @registry_items
  end

  def update
    @registry_item = RegistryItem.find(params[:id])
    @registry_item.update_attributes registry_item_params
    render json: @registry_item
  end

  private

  def registry_item_params
    params.require(:registry_item).permit(:purchased, :purchaser_name)
  end
end
