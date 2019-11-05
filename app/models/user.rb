class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  after_create :gen_user_api_key

  def gen_user_api_key
    #need session api_key for user
    #this will gen a random hex string
    self.update(api_key: SecureRandom.hex)
  end
end
