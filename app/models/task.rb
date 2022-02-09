class Task < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    enum status: { '未着手': 0, '着手中': 1, '完了': 2 }

  scope :with_title, -> (title) { where("title like ?", "%#{title}%") }
  scope :with_status, ->(status) { where(status: status) }

  def self.search(title, status)
    if title.nil?
        with_status(status)
    elsif status.nil?
      with_title(title)
    elsif !title.nil? && !status.nil?
      with_status(status).with_title(title)
    else
      all
    end
  end
end
