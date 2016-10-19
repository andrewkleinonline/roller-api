require 'rails_helper'

describe "Roller API Tags" do
  context 'GET requests' do
    before(:each) do
      @tag1 = Tag.create(name: 'surprise')
      @tag2 = Tag.create(name: 'anime')
    end

    describe 'get /tags/:id' do
      context "exists" do
        it 'returns a JSON collection of a single tag' do
          get "/api/v1/tags/#{@tag1.id}"
          response_body = JSON.parse(response.body)
          expect(response).to be_success
          expect(response_body["data"]["attributes"]["name"]).to eq("surprise")
        end
      end

      context "does not exist" do
        it 'does not return a JSON collection of the tag and returns a 404 error' do
          get '/api/v1/tags/0'
          response_body = JSON.parse(response.body)
          expect(response.status).to eq(404)
        end
      end
    end
  end

  context 'POST requests' do
    describe 'post /tags' do
      context "is valid and saves to database" do
        it 'returns a JSON collection of a single tag' do
          post "/api/v1/tags/", params: {tag: {name: 'funny'}}
          tag = Tag.last
          expect(response).to be_success
          expect(tag.name).to eq("funny")
        end
      end

      context "is not valid and does not save to database" do
        it 'does not return a JSON collection 400 error' do
          post "/api/v1/tags/", params: {tag: {name: ''}}
          response_body = JSON.parse(response.body)
          expect(response.status).to eq(400)
        end
      end
    end
  end
end