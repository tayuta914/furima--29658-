class Personal < ApplicationRecord
  belongs_to :order
  belongs_to :user
  validates :user_id, presence: true
end
