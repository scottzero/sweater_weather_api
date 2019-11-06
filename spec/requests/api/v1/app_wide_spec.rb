require "rails_helper"

RSpec.describe "Test real api calls" do
  it "tests my background image functionality" do
    city_state = "denver,co"

     get "/api/v1/backgrounds?location=#{city_state}"

     expect(response).to be_successful
     img_data = JSON.parse(response.body)
     expect(img_data["data"].class).to eq(Hash)
     expect(img_data["data"]["attributes"].keys).to eq(["id", "url"])
  end
  it "tests my forecast functionality" do
    city_state = "denver,co"

    get "/api/v1/forecast?location=#{city_state}"

    expect(response).to be_successful
    forecast_data = JSON.parse(response.body)
    expect(forecast_data["data"]["id"]).to eq("1")
    expect(forecast_data["data"]["type"]).to eq("forecast")
    expect(forecast_data["data"]["attributes"]["id"]).to eq(1)
    expect(forecast_data["data"]["attributes"]["location"]).to eq("#{city_state}")
  end

  it "tests my new user functionality" do
    post "/api/v1/users?email=scp@gmail.com&password=hello&password_confirmation=hello"
    expect(response).to be_successful
  end

  it "tests user crednetials are not unique so render json error" do
    post "/api/v1/users?email=scp@gmail.com&password=hello&password_confirmation=hello"
    post "/api/v1/users?email=scp@gmail.com&password=hello&password_confirmation=hello"
    expect(response).to_not be_successful
  end

  it "tests my sessions functionality" do
    post "/api/v1/users?email=scp@gmail.com&password=hello&password_confirmation=hello"
    post "/api/v1/sessions?email=scp@gmail.com"
    expect(response).to be_successful
  end
end
