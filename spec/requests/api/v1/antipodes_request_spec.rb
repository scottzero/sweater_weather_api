require "rails_helper"
# Your endpoint will return:
# - the starting city name
# - the name of the antipode city
# - the current weather summary for the antipode city

RSpec.describe "antipode api endpoint" do
  it "returns the city details" do
    city = "hongkong"
    get "/api/v1/antipode?loc=#{city}"
    expect(response).to be_successful
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_response[:data]).to be_present
    expect(parsed_response[:data].class).to eq(Hash)
  end
end
