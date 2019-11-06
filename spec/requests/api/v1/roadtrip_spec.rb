require "rails_helper"

RSpec.describe "Test roadtrip class functionality" do
  it "see if I can get roadtrip data" do
    scott = User.create!(email: "super@example.com",password: "password")
     post "/api/v1/roadtrip?origin=Colorado&destination=Ohio&key=#{scott.api_key}"
     expect(response).to be_successful
  end
end
