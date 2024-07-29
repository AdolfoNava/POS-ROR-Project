# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  due_date       :date
#  items_count    :integer
#  payment_method :string
#  pre_paid       :float
#  price          :float
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :integer
#  employee_id    :integer
#
class Order < ApplicationRecord
  has_many  :items, class_name: "Item", foreign_key: "order_id", dependent: :destroy
  belongs_to :customer, required: true, class_name: "Customer", foreign_key: "customer_id", counter_cache: true
  belongs_to :employee, required: true, class_name: "User", foreign_key: "employee_id"
  accepts_nested_attributes_for :items
  validates(:price, presence: true)
  enum status: { created: "created", cancelled: "cancelled",in_progress: "in progress", ready: "ready", completed: "completed" }
end
