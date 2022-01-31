FactoryBot.define do
  factory :task do
    sequence(:id) { |n| n }
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:content) { |n| "内容#{n}" }
  end
end
