require 'rails_helper'

RSpec.describe Roll, type: :model do
  it 'is valid when it has a title, start time, end time, and youtube uri' do
    roll = Roll.new(title: 'Bang', start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
    expect(roll).to be_valid
  end

  it 'is not valid when it does not have a title' do
    roll = Roll.new(start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
    roll.valid?
    expect(roll.errors[:title]).to include("can't be blank")
  end

  it 'is not valid when the title is over 50 characters long' do
    roll = Roll.new(title: 'Bangs his friends. They are startled, but decide to maintain their friendship. After all, Rick is a good guy.', start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
    roll.valid?
    expect(roll.errors[:title]).to include("is too long (maximum is 50 characters)")
  end

  it 'is not valid when it does not have a start time' do
    roll = Roll.new(title: 'Bang', end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
    roll.valid?
    expect(roll.errors[:start_time]).to include("can't be blank")
  end

  it 'is not valid when it has a negative start time' do
    roll = Roll.new(title: 'Bang', start_time: -5, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
    roll.valid?
    expect(roll.errors[:start_time]).to include("must be greater than or equal to 0")
  end

  it 'is not valid when it does not have an end time' do
    roll = Roll.new(title: 'Bang', start_time: 19, youtube_identifier: 'lYbYoaBrXpU')
    roll.valid?
    expect(roll.errors[:end_time]).to include("can't be blank")
  end

  it 'is not valid when the end time is before the start time' do
    roll = Roll.new(title: 'Bang', start_time: 19, end_time: 10, youtube_identifier: 'lYbYoaBrXpU')
    #Error message will likely be set in custom validation -- can add here later
    expect(roll).to_not be_valid
  end

  xit 'is not valid when the end time is greater than the length of the youtube video.' do
    #It is not clear how to test for this at this point
  end

  it 'is not valid when it does not have a youtube uri' do
    roll = Roll.new(title: 'Bang', start_time: 19, end_time: 23)
    roll.valid?
    expect(roll.errors[:youtube_identifier]).to include("can't be blank")
  end

  it 'is not valid when the youtube identifier contains at least one character other than a-z, A-Z, 0-9, _, and -.' do
    roll = Roll.new(title: 'Bang', start_time: 19, end_time: 23, youtube_identifier: 'lYbYo?BrXpU')
    #Error message will likely be set in custom validation -- can add here later
    expect(roll).to_not be_valid
  end

  it 'is not valid when the youtube identifier is not 11 characters long' do
    roll = Roll.new(title: 'Bang', start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrX')
    #Error message will likely be set in custom validation -- can add here later
    expect(roll).to_not be_valid
  end

  it 'knows about its tags' do
    roll = Roll.create(title: 'Bang', start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
    tag1 = Tag.create('surprise')
    tag2 = Tag.create('anime')

    roll.tags << tag1
    roll.tags << tag2

    expect(roll.tags[0].name).to be('surprise')
    expect(roll.tags[1].name).to be('anime')
  end
end
