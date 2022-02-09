require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let!(:task1) { create(:task, id: 1, title: "task1", created_at: DateTime.new(2022, 1, 14), deadline: DateTime.new(2022, 1, 25), status: 0) }
  let!(:task2) { create(:task, id: 2, title: "task2", created_at: DateTime.new(2022, 1, 13), deadline: DateTime.new(2022, 1, 27), status: 1) }
  let!(:task3) { create(:task, id: 3, title: "task3", created_at: DateTime.new(2022, 1, 12), deadline: DateTime.new(2022, 1, 26), status: 2) }
  
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
  describe "検索機能" do
    context "タイトル検索" do
      it "タイトルが「task1」であるTaskが取得できる" do
        get tasks_path(title: "task1")
        expect(response.body).to eq([task1].to_json)
      end
    end
    context "ステータス検索" do
      it "ステータスが「未着手」であるTaskが取得できる" do
        get tasks_path(status: "未着手")
        expect(response.body).to eq([task1].to_json)
      end
      it "ステータスが「着手中」であるTaskが取得できる" do
        get tasks_path(status: "着手中")
        expect(response.body).to eq([task2].to_json)
      end
      it "ステータスが「完了」であるTaskが取得できる" do
        get tasks_path(status: "完了")
        expect(response.body).to eq([task3].to_json)
      end
    end
    context "タイトルとステータス両方検索" do
      it "タイトルが「task1」、ステータスが「未着手」であるTaskが取得できる" do
        get tasks_path(title: "task1", status: "未着手")
        expect(response.body).to eq([task1].to_json)
      end
      it "タイトルが「task2」、ステータスが「着手中」であるTaskが取得できる" do
        get tasks_path(title: "task2", status: "着手中")
        expect(response.body).to eq([task2].to_json)
      end
      it "タイトルが「task3」、ステータスが「完了」であるTaskが取得できる" do
        get tasks_path(title: "task3", status: "完了")
        expect(response.body).to eq([task3].to_json)
      end
    end
  end
end
