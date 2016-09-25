require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'is valid with a name' do
    tag = Tag.new(name: 'animal fail')
    expect(tag).to be_valid
  end

  it 'is invalid without a name' do
    tag = Tag.new()
    tag.valid?
    expect(tag.errors[:name]).to include("can't be blank")
  end

  it 'is invalid if longer than 16 characters' do
    tag = Tag.new(name: 'failure to launch')
    tag.valid?
    expect(tag.errors[:name]).to include("is too long (maximum is 16 characters)")
  end

  it 'is invalid if it contains characters other than lower-case letters and spaces' do
    tag_with_capital_name = Tag.new(name: 'Fail')
    tag_with_special_characters = Tag.new(name: 'f4il!')

    #Error message will likely be set in custom validation -- can add here later
    expect(tag_with_capital_name).to_not be_valid
    expect(tag_with_special_characters).to_not be_valid
  end
end
