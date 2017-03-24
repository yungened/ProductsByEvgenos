class Message < ApplicationRecord
  validates :content, :rating, presence: true

  belongs_to :product
  belongs_to :user
end
