# frozen_string_literal: true

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
  belongs_to :category, required: true, class_name: 'Category', foreign_key: 'category_id'
  has_many :items
  validates(:name, presence: true)
  validates(:category_id, presence: true)

  def self.ransackable_attributes(_auth_object = nil)
    %w[name category_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['category']
  end
  # before_validation :set_defaults

  # private

  # def set_defaults
  #   base_price = 0 if base_price.empty?
  # end
end
