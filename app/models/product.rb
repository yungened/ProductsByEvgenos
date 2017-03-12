class Product < ApplicationRecord
  belongs_to :category
  has_attached_file :image, styles: { large: "800x300>", medium: "320x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  default_scope { order(id: :desc) }
end
