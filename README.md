```
Setup Instructions:

Step 1: Clone the repo

Step 2: cd into the directory and run `bundle install`

Step 3: Start the server with `rails s`
```

Working with the API:

First create your user with a POST to /api/v1/users
- `{"user": {"first_name":"John", "last_name":"Romas", email: "john.romas87@gmail.com}}`

Next you can create a todo! POST to api/vi/todo_items
= `{"user_id":"1", "todo_item": {"title":"A new todo item!", "due_date":"07-01-2015"}}`

Mark a todo item as complete with a PUT to api/v1/todo_items/:todo_item_id
- `{"user_id":"1", "todo_item": {"completed":"true"}}`

Retrieve only incomplete todo items with GET to /api/v1/todo_items
- `{"user_id":"1", "status":"incomplete"}` (if you want all completed items, use "complete" for the status param; if you'd like all items regardless of status, don't include the status param)
