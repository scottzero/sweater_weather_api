require "rails_helper"

RSpec.describe "Use the flikr api" do
  it "to get a background image for a city" do
    city_state = "denver,co"

    get "/api/v1/backgrounds?location=#{city_state}"

    expect(response).to be_successful
    img_data = JSON.parse(response.body)
    expect(img_data["data"].class).to eq(Hash)
    expect(img_data["data"]["attributes"].keys).to eq(["id", "url"])
  end
end
