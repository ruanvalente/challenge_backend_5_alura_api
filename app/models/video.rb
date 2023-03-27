class Video < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :category_id, presence: true
end
