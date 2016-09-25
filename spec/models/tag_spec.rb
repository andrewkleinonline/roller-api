require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'is valid with a name' do
    tag = Tag.new(name: 'fail')
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
end
