require 'rails_helper'

describe "Roller API Rolls" do
  context 'GET requests' do
    before(:each) do
      @roll = Roll.create(title: 'Bang', start_time: 19, end_time: 23, youtube_identifier: 'lYbYoaBrXpU')
      @roll2 = Roll.create(title: 'Believe in Me!', start_time: 5, end_time: 11, youtube_identifier: 'BwFNWyqHHyY')
    end


    describe "get /rolls" do
      it 'returns a JSON collection of all of the rolls' do
        get '/api/v1/rolls'
        response_body = JSON.parse(response.body)
        expect(response).to be_success
        expect(response_body["data"].length).to eq(2)
      end
    end


    describe 'get /rolls/:id' do
      context "exists" do
        it 'returns a JSON collection of a single roll' do
          get "/api/v1/rolls/#{@roll.id}"
          response_body = JSON.parse(response.body)
          expect(response).to be_success
          expect(response_body["data"]["attributes"]["title"]).to eq("Bang")
          expect(response_body["data"]["attributes"]["start-time"]).to eq(19)
        end
      end

      context "does not exist" do
        it 'does not return a JSON collection of the rolls and returns a 404 error' do
          get '/api/v1/rolls/0'
          response_body = JSON.parse(response.body)
          expect(response.status).to eq(404)
        end
      end
    end
  end

  context 'POST requests' do

    describe 'post /rolls' do
      context "is valid and saves to database" do
        it 'returns a JSON collection of a single roll' do
          post "/api/v1/rolls/", params: {roll: {title: 'Bang', start_time: 10, end_time: 20, youtube_identifier: 'lYbYoaBrXpU'}}
          roll = Roll.last
          expect(response).to be_success
          expect(roll.title).to eq("Bang")
        end
      end

      context "is not valid and does not save to database" do
        it 'does not return a JSON collection 400 error' do
          post "/api/v1/rolls/", params: {roll: {title: 'Bang', start_time: 20, end_time: 10, youtube_identifier: 'lYbYoaBrXpU'}}
          response_body = JSON.parse(response.body)
          expect(response.status).to eq(400)
        end
      end
    end
  end
end