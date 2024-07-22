# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  base_price  :float
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
class Option < ApplicationRecord
  belongs_to :category, required: true, class_name: "Category", foreign_key: "name"
end
