# frozen_string_literal: true

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
  has_many  :items, class_name: 'Item', foreign_key: 'order_id', dependent: :destroy

  belongs_to :customer, required: true, class_name: 'Customer', foreign_key: 'customer_id'
  belongs_to :employee, required: true, class_name: 'User', foreign_key: 'employee_id'

  enum payment_method: { cash: 'cash', card: 'card', phone: 'phone', check: 'check' }
  enum status: { created: 'created',
                 in_progress: 'in progress',
                 ready: 'ready',
                 cancelled: 'cancelled',
                 completed: 'completed' }

  accepts_nested_attributes_for :items

  def self.ransackable_attributes(_auth_object = nil)
    %w[id due_date status]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['customer']
  end
  validates(:price, presence: true)
  validates(:due_date, presence: true)

  after_initialize :init

  def init
    self.pre_paid ||= 0.0
    self.price ||= 0.0
    self.items_count ||= 0.0
  end
end
