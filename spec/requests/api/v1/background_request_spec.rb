require "rails_helper"

RSpec.describe "Use the flikr api" do
  it "to get a background image for a city" do
    city_state = "denver,co"

    get "/api/v1/backgrounds?location=#{city_state}"

    expect(response).to be_successful
  end
end
