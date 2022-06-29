class Project < ApplicationRecord
  after_create_commit :actions_after_create
  before_destroy :purge_images

  has_many_attached :images, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :images, presence: true, length: { is: 2 }
  validates :tags, presence: true
  validates :description, presence: true, length: { minimum: 100, maximum: 5000 }
  validates :live, presence: true
  validates :source, presence: true
  validates :demo, presence: true

  private

  def purge_images
    images.each(&:purge)
  end

  def actions_after_create
    update_columns(image: url_for(images[0]))
    update_columns(mobile_image: url_for(images[1]))
  end
end
