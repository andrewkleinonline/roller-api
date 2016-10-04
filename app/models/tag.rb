class Tag < ApplicationRecord
  has_and_belongs_to_many :rolls

  validates :name, presence: true
  validates :name, length: { maximum: 16 }
  validates :name, format: { with: /\A[a-z ]+\z/ }
  end
