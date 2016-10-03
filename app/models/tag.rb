class Tag < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 16 }

  validates :name, format: { with: /\A[a-z ]+\z/ }
  end
