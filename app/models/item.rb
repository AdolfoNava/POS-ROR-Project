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
#  option_id  :integer
#  order_id   :integer
#
class Item < ApplicationRecord

  belongs_to :order, required: true, class_name: "Order", foreign_key: "order_id", counter_cache: true
  belongs_to :option
  validates(:name, presence: true) 
  validates(:price, presence: true) 
  validates(:quantity, presence: true) 
  validates(:order_id, presence: true)  
end
