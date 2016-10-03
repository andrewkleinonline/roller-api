class Roll < ApplicationRecord
  validates :title, :start_time, :end_time, :youtube_identifier, presence: true
  validates :title, length: { maximum: 50 }
  validates :start_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :end_time_greater_than_start_time
  validates :youtube_identifier, format: { with: /\A[\w-]{11}\z/ }

  def end_time_greater_than_start_time
    if end_time.to_i <= start_time.to_i
      errors.add(:end_time, "Can't be less than start time." )
    end
  end

end
