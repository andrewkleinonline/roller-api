class Roll < ApplicationRecord
  validates :title, :start_time, :end_time, :youtube_identifier, presence: true
  validates :title, length: { maximum: 50 }
end
