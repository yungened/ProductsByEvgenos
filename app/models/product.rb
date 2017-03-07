class Product < ApplicationRecord
  has_attached_file :image, styles: { large: "600x600>", medium: "150x150", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  default_scope { order(id: :desc) }
end
