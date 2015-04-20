require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :todo_items }

  it "has a valid factory" do
    valid_factory = FactoryGirl.create(:user)
    expect(valid_factory).to be_valid
  end

  it "is invalid without a first name" do
    user_without_fname = FactoryGirl.build(:user, first_name: "")
    expect(user_without_fname).to_not be_valid
  end

  it "is invalid without a last name" do
    user_without_lname = FactoryGirl.build(:user, last_name: "")
    expect(user_without_lname).to_not be_valid
  end

  it "doesn't create a user with the same email" do
    FactoryGirl.create(:user)
    invalid_user = User.new(first_name: "Jane", last_name: "Doe", email: "jdoe@example.com")
    expect(invalid_user).to_not be_valid
  end
end
