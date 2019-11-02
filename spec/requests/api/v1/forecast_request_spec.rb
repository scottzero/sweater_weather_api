require "rails_helper"

RSpec.describe "Consuming forcast api endpoint" do
  it "returns the weather forecast for a specific city" do
    city_state = "denver,co"

    get "/api/v1/forecast?location=#{city_state}"

    expect(response).to be_successful
  end
end
