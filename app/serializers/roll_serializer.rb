class RollSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_time, :end_time, :youtube_identifier
  has_many :tags
end
