class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  enum status: [:processing, :paid, :shipped, :completed]
  default_scope { order(id: :desc) }
end
