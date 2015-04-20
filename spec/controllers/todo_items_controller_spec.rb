require "rails_helper"

RSpec.describe Api::V1::TodoItemsController, type: :controller do

  let!(:user)      { FactoryGirl.create(:user) }
  let!(:todo_item) { FactoryGirl.create(:todo_item, user: user) }

  context "GET #index" do
    it "returns a list of todos" do
      get :index
      expect(@response.status).to eq(200)
      expect(assigns(:todo_items)).to eq([todo_item])
    end
  end

  context "GET #show" do
    it "returns a single todo" do
      get :show, {
        id: 1
      }
      expect(@response.status).to eq(200)
      expect(assigns(:todo_item)).to eq(todo_item)
    end
  end

  context "PATCH #update" do
    it "updates a todo" do
      patch :update, {
        id: todo_item.id,
        todo_item: {
          completed: true
        }
      }
      expect(@response.status).to eq(204)
      expect(assigns(:todo_item)).to eq(todo_item)
    end
  end

  context "POST #create" do
    it "creates a todo" do
      post :create, {
        todo_item: {
          title: "An awesome todo item",
          user_id: user.id,
          due_date: Date.today + 1
        }
      }
      expect(@response.status).to eq(201)
    end
  end
end
