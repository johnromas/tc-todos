FactoryGirl.define do
  factory :todo_item do
    title "My test todo item"
    user
    due_date "2015-04-21"
    completed false
  end
end



