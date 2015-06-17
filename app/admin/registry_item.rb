ActiveAdmin.register RegistryItem do

permit_params :name,
              :description,
              :price,
              :quantity,
              :retailer,
              :image_url,
              :link,
              :ranking

end
