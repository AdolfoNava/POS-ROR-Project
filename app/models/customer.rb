# == Schema Information
#
# Table name: customers
#
#  id           :integer          not null, primary key
#  address      :string
#  email        :string
#  first_name   :string
#  last_name    :string
#  orders_count :integer
#  phone_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Customer < ApplicationRecord
  has_many  :orders, class_name: "Order", foreign_key: "customer_id", dependent: :destroy
  
  validates(:first_name ,presence: true)
  validates(:last_name ,presence: true)
  validates(:phone_number ,presence: true)
end
