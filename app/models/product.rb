class Product < ApplicationRecord
  belongs_to :category
  has_many :messages, :dependent => :destroy
  has_attached_file :image, styles: { large: "800x300>", medium: "320x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, :description, :price, presence: true
  validates_numericality_of :price, :on => :create, :greater_than => 0
  validates_numericality_of :qty, :on => :create, :greater_than => 0

  default_scope { order(id: :desc) }
end
