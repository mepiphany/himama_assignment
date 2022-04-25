require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a first_name" do
      expect(User.new(first_name: nil, last_name: "world", email: "test@test.com", password: "password", password_confirmation: "password")).to_not be_valid 
  end
  it "is not valid without a last_name" do
      expect(User.new(first_name: "hello", last_name: nil, email: "test@test.com", password: "password", password_confirmation: "password")).to_not be_valid 
  end
end
