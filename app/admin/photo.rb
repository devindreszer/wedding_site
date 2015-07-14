ActiveAdmin.register Photo do

permit_params :text,
              :location,
              :description,
              :date,
              :image_url

end
