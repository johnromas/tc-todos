class TodoItem < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5 }
  validates :user, presence: true

  scope :filtered, -> (status) {
    filter = case status
             when "complete"
               true
             when "incomplete"
               false
             end
    filter ?  where(completed: filter) : all
  }
end
