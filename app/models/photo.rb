# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  location    :text
#  description :text
#  date        :date
#  image_url   :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Photo < ActiveRecord::Base
end
