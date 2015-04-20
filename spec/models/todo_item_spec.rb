require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  it { should belong_to(:user) }

  it "has a valid factory" do
    valid_factory = FactoryGirl.create(:todo_item)
    expect(valid_factory).to be_valid
  end

  it "is invalid without a title" do
    todo_without_title = FactoryGirl.build(:todo_item, title: "")
    expect(todo_without_title).to_not be_valid
  end

  it "is invalid without at least a 5 character title" do
    short_todo_title = FactoryGirl.build(:todo_item, title: "1234")
    expect(short_todo_title).to_not be_valid
  end

  it "is invalid without a user" do
    todo_without_user = FactoryGirl.build(:todo_item, user: nil)
    expect(todo_without_user).to_not be_valid
  end
end
