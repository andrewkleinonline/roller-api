require 'rails_helper'

RSpec.describe Roll, type: :model do
  describe "validity:" do
    it 'is valid when it has a title, start time, end time, and youtube uri' do
      roll = Roll.new(title: 'Rick Roll', start_time: 19, end_time: 23, youtube_uri: 'lYbYoaBrXpU')
      expect(roll).to be_valid
    end

    it 'is not valid when it does not have a title' do
      roll = Roll.new(start_time: 19, end_time: 23, youtube_uri: 'lYbYoaBrXpU')
      roll.valid?
      expect(roll.errors[:title]).to include("can't be blank")
    end

    it 'is not valid when it does not have a start time' do
      roll = Roll.new(title: 'Rick Roll', end_time: 23, youtube_uri: 'lYbYoaBrXpU')
      roll.valid?
      expect(roll.errors[:start_time]).to include("can't be blank")
    end

    it 'is not valid when it does not have a start time' do
      roll = Roll.new(title: 'Rick Roll', start_time: 19, youtube_uri: 'lYbYoaBrXpU')
      roll.valid?
      expect(roll.errors[:end_time]).to include("can't be blank")
    end

    it 'is not valid when it does not have a youtube uri' do
      roll = Roll.new(title: 'Rick Roll', start_time: 19, end_time: 23)
      roll.valid?
      expect(roll.errors[:youtube_uri]).to include("can't be blank")
    end
  end

end
