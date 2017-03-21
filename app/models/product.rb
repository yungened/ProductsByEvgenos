class Product < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  belongs_to :category
  has_many :messages, :dependent => :destroy
  has_attached_file :image, styles: { large: "800x300>", medium: "320x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, :description, :price, presence: true
  validates_numericality_of :price, :on => :create

  default_scope { order(id: :desc) }
end
