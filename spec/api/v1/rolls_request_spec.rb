require 'rails_helper'

describe "Roller API" do

  before(:each) do
    roll = Roll.create(title: 'Bang', start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
    roll2 = Roll.create(title: 'Believe in Me!', start_time: 5, end_time: 11, youtube_identifier: 'BwFNWyqHHyY')
  end


  describe "get /rolls" do
    context "exists" do
      xit 'returns a JSON collection of all of the rolls' do
        # get '/api/v1/rolls'
        # response_body = JSON.parse(response.body)
        # expect(response).to be_success
        # expect(response_body.length).to eq(2)
      end
    end

    context "does not exist" do
      xit 'does not return a JSON collection of the rolls' do
        # get '/api/v1/rolls'
        # response_body = JSON.parse(response.body)
        # expect(response.status).to eq(404)
        # expect(response.error).to eq("Not Found")
      end
    end
  end


  describe 'get /rolls/:id' do
    context "exists" do
      xit 'returns a JSON collection of a single roll' do
        # get '/api/v1/roll/1'
        # response_body = JSON.parse(response.body)
        # expect(response).to be_success
        # expect(response_body.length).to eq(1)
      end
    end

    context "does not exist" do
      xit 'does not return a JSON collection of a single roll' do
      end
    end
  end

  # describe 'post /rolls/:id' do
  #   context "is valid" do
  #     it '' do
  #     end
  #   end

  #   context "is invalid" do
  #     it '' do
  #     end
  #   end
  # end

  # describe 'patch /rolls/:id' do
  #   context "is valid" do
  #     it '' do
  #     end
  #   end

  #   context "is invalid" do
  #     it '' do
  #     end
  #   end
  # end

  # describe 'destroy /rolls/:id' do
  #   context "is valid" do
  #     it '' do
  #     end
  #   end

  #   context "is invalid" do
  #     it '' do
  #     end
  #   end
  # end

end