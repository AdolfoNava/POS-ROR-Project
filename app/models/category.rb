# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many  :options, class_name: "Option", foreign_key: "name", dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
  
end
