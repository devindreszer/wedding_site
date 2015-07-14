# == Schema Information
#
# Table name: registry_items
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :text
#  price          :decimal(8, 2)
#  quantity       :integer
#  purchased      :boolean
#  retailer       :string
#  image_url      :string
#  link           :string
#  ranking        :integer
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  purchaser_name :string
#

class RegistryItem < ActiveRecord::Base
  belongs_to :user
end
