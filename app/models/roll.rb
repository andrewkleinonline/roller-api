class Roll < ApplicationRecord  
  validates :title, :start_time, :end_time, :youtube_identifier, presence: true
  validates :title, length: { maximum: 50 }
  validates :start_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :end_time_greater_than_start_time
  validate :youtube_identifier_format

  def end_time_greater_than_start_time
    if end_time.to_i <= start_time.to_i
      errors.add(:end_time, "Can't be less than start time." )
    end
  end

  def youtube_identifier_format
    if youtube_identifier
      if !youtube_identifier.match(/\A[\w-]{11}\z/)
        errors.add(:youtube_identifier, "Has wrong format")
      end
    end
  end

end
