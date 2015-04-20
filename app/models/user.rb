class User < ActiveRecord::Base
  has_many :todo_items

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true
end
