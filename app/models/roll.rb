class Roll < ApplicationRecord
  validates :title, :start_time, :end_time, :youtube_identifier, presence: true
  validates :title, length: { maximum: 50 }
  validates :start_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
