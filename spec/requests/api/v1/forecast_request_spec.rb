require "rails_helper"

RSpec.describe "Consuming forcast api endpoint" do
  it "returns the weather forecast data for a specific city" do
    json_response =  File.open("./app/fixtures/forecast_denver_api_call.json")
    WebMock.stub_request(:get, 'http://localhost:3000/api/v1/forecast?location=denver,co').
    to_return(status: 200, body: json_response)
  end
end
