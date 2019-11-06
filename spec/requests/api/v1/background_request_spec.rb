require "rails_helper"

RSpec.describe "Use the flikr api" do
  it "to get a background image for a city" do
    json_response =  File.open("./app/fixtures/flickr_api_call.json")
    WebMock.stub_request(:get, 'http://localhost:3000/api/v1/backgrounds?location=denver,co').
    to_return(status: 200, body: json_response)
  end
end
