class Category < ApplicationRecord
  has_many :videos, dependent: :destroy

  validates :title, presence: true
  validates :color, presence: true
end
