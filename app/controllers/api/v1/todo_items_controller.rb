class Api::V1::TodoItemsController < Api::BaseController
  before_filter :set_user

  def index
    @todo_items = current_user.todo_items.filtered(params[:status])
    render json: @todo_items
    # curl -v -H "Accept: application/json" -H "Content-type: application/json" -X GET -d ' {"user_id":"1"}'  http://localhost:3000/api/v1/todo_items
    # curl -v -H "Accept: application/json" -H "Content-type: application/json" -X GET -d ' {"user_id":"1", "status":"complete"}'  http://localhost:3000/api/v1/todo_items
  end

  def show
    @todo_item = current_user.todo_items.find(params[:id])
    render json: @todo_item
    # curl -v -H "Accept: application/json" -H "Content-type: application/json" -X GET -d ' {"user_id":"1"}'  http://localhost:3000/api/v1/todo_items/1
  end

  def update
    @todo_item = current_user.todo_items.find(params[:id])

    if @todo_item.update(todo_params)
      render json: @todo_item, status: :no_content
    else
      render json: { errors: @todo_item.errors }, status: :bad_request
    end
    # curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d ' {"user_id":"1", "todo_item": {"id":"1", "completed":"true"}}'  http://localhost:3000/api/v1/todo_items/1
  end

  def create
    @todo_item = current_user.todo_items.new(todo_params)

    if @todo_item.save
      render json: @todo_item, status: :created
    else
      render json: { errors: @todo_item.errors }, status: :bad_request
    end
    # curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"user_id":"1", "todo_item": {"title":"A new item", "due_date":"11-27-2014", "completed":"false"}}'  http://localhost:3000/api/v1/todo_items/
  end

  private

  def todo_params
    params.require(:todo_item).permit(:title, :user_id, :due_date, :completed)
  end
end
