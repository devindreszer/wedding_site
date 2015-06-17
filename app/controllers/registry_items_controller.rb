class RegistryItemsController < ApplicationController
  def index
    @registry_items = RegistryItem.all
    render json: @registry_items
  end
end
