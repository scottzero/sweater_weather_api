require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Methods" do
    it "creates api key for user" do
      attribute = {
        "email" => "user@mail.com",
        "password" => "password",
        "password_confirmation" => "password"
      }
    scott = User.create!(attribute)
    expect(scott.api_key.class).to eq(String)
    end
  end
end
