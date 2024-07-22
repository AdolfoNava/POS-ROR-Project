# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :float
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#
class Item < ApplicationRecord

  belongs_to :order, required: true, class_name: "Order", foreign_key: "order_id", counter_cache: true
end
