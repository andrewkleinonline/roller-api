require 'rails_helper'

RSpec.describe Roll, type: :model do
  describe "validity:" do
    it 'is valid when it has a title, start time, end time, and youtube uri' do
      roll = Roll.new(title: 'Rick Roll', start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
      expect(roll).to be_valid
    end

    it 'is not valid when it does not have a title' do
      roll = Roll.new(start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
      roll.valid?
      expect(roll.errors[:title]).to include("can't be blank")
    end

    it 'is not valid when the title is over 50 characters long' do
      roll = Roll.new(title: 'Rick rolls his friends. They are startled, but decide to maintain their friendship. After all, Rick is a good guy.', start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
      roll.valid?
      expect(roll.errors[:title]).to include("is too long (maximum is 50 characters)")
    end

    it 'is not valid when it does not have a start time' do
      roll = Roll.new(title: 'Rick Roll', end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
      roll.valid?
      expect(roll.errors[:start_time]).to include("can't be blank")
    end

    it 'is not valid when it has a negative start time' do
      roll = Roll.new(title: 'Rick Roll', start_time: -5, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
      roll.valid?
      expect(roll.errors[:start_time]).to include("can't be blank")
    end

    it 'is not valid when it does not have an end time' do
      roll = Roll.new(title: 'Rick Roll', start_time: 19, youtube_identifier: 'lYbYoaBrXpU')
      roll.valid?
      expect(roll.errors[:end_time]).to include("can't be blank")
    end

    it 'is not valid when it does not have a youtube uri' do
      roll = Roll.new(title: 'Rick Roll', start_time: 19, end_time: 23)
      roll.valid?
      expect(roll.errors[:youtube_identifier]).to include("can't be blank")
    end
  end

end
