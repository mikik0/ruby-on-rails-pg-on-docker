require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let!(:task1) { create(:task, id: 1, created_at: DateTime.new(2022, 1, 14), deadline: DateTime.new(2022, 1, 25)) }
  let!(:task2) { create(:task, id: 2, created_at: DateTime.new(2022, 1, 13), deadline: DateTime.new(2022, 1, 27)) }
  let!(:task3) { create(:task, id: 3, created_at: DateTime.new(2022, 1, 12), deadline: DateTime.new(2022, 1, 26)) }
  
  # Taskが降順に並んでいるか確認
  describe "GET /tasks" do
    it "Taskが降順に並んでいるか確認" do
      get tasks_path
      expect(response.body).to eq([task1, task2, task3].to_json)
    end
  end
  describe "GET /tasks?deadline" do
    it "Taskが終了期限に並んでいるか確認" do
      get tasks_path(sort: "deadline")
      expect(response.body).to eq([task2, task3, task1].to_json)
    end
  end
end
