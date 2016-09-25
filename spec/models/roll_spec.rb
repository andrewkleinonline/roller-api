require 'rails_helper'

RSpec.describe Roll, type: :model do
  describe "validity:" do
    it 'is valid when it has a title, start time, end time, and youtube uri' do
      roll = Roll.new(title: 'Rick Roll', start_time: 19, end_time: 23, youtube_uri: 'lYbYoaBrXpU')
      expect(roll).to be_valid
    end
  end

end
