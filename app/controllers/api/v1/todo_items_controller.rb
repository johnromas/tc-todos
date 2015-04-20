class Api::V1::TodoItemsController < Api::BaseController
  before_filter :set_user

  def index
    @todo_items = current_user.todo_items
    render json: @todo_items
  end

  def show
    @todo_item = current_user.todo_items.find(params[:id])
    render json: @todo_item
  end

  def update
    @todo_item = current_user.todo_items.find(params[:id])

    if @todo_item.update(todo_params)
      render json: @todo_item, status: :no_content
    else
      render json: { errors: @todo_item.errors }, status: :bad_request
    end
  end

  def create
    @todo_item = current_user.todo_items.new(todo_params)

    if @todo_item.save
      render json: @todo_item, status: :created
    else
      render json: { errors: @todo_item.errors }, status: :bad_request
    end
  end

  private

  def todo_params
    params.require(:todo_item).permit(:title, :user_id, :due_date, :completed)
  end
end
