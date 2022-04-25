require 'rails_helper'

RSpec.describe TimeSheet, type: :model do
  before(:each) { User.create(first_name: "john", last_name: "doe", 
                                email: "johndoe@example.com", password: "password") }
  
  it "is not valid when clock in date is from the past" do
    clock_in = Date.today - 1.day
    clock_out = Date.today
    expect(TimeSheet.new(clock_in: clock_in, clock_out: clock_out, user_id: User.first.id)).to_not be_valid
  end

  it "is not valid when clock in date is after clock out date" do
    clock_in = Date.today + 1
    clock_out = Date.today
    expect(TimeSheet.new(clock_in: clock_in, clock_out: clock_out, user_id: User.first.id)).to_not be_valid
  end

  it "is not valid when clock out date is from the past" do
    clock_in = Date.today
    clock_out = Date.today - 1
    expect(TimeSheet.new(clock_in: clock_in, clock_out: clock_out, user_id: User.first.id)).to_not be_valid
  end

  it "is not valid when clock out date before clock in date" do
    clock_in = Date.today
    clock_out = Date.today - 1
    expect(TimeSheet.new(clock_in: clock_in, clock_out: clock_out, user_id: User.first.id)).to_not be_valid
  end
end
