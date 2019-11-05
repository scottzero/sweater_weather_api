require "rails_helper"

RSpec.describe "Consuming forcast api endpoint" do
  it "returns the weather forecast for a specific city" do
    city_state = "denver,co"

    get "/api/v1/forecast?location=#{city_state}"

    expect(response).to be_successful
    forecast_data = JSON.parse(response.body)
    expect(forecast_data["data"]["id"]).to eq("1")
    expect(forecast_data["data"]["type"]).to eq("forecast")
    expect(forecast_data["data"]["attributes"]["id"]).to eq(1)
    expect(forecast_data["data"]["attributes"]["location"]).to eq("#{city_state}")
  end
end
