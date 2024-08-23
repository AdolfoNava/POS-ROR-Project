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
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Customer < ApplicationRecord
  # the issue in `app/services/customer_moderation_service.rb` affects this file as well
  include Customer::CustomerModeratable
  def self.ransackable_attributes(auth_object = nil)
    %w[phone_number last_name]
  end
  has_many :orders, class_name: 'Order', foreign_key: 'customer_id', dependent: :destroy

  validates(:first_name, presence: true)
  validates(:last_name, presence: true)
  validates(:phone_number, presence: true, numericality: { only_integer: true })
  # should get rid of customer_moderation_service and customer_moderatable, e.g.:
  # EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: { with: EMAIL_REGEX, message: "must be a valid email address" }
end
