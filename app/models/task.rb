class Task < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    enum status: { '未着手': 0, '着手中': 1, '完了': 2 }

    def self.search(keyword)
        if search
            Task.where(['title LIKE ?', "%#{keyword}%"])
        else
            Task.all
        end
    end
end
