class Project < ApplicationRecord
  has_many_attached :images, dependent: :destroy

  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :images, presence: true
  validates :tags, presence: true
  validates :description, presence: true, length: {minimum: 100, maximum: 5000}
  validates :live, presence: true
  validates :source, presence: true
  validates :demo, presence: true

end
