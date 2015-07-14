class AddPurchaserNameToRegistryItems < ActiveRecord::Migration
  def change
    add_column :registry_items, :purchaser_name, :string
  end
end
