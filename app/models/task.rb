class Task < ApplicationRecord
    validates :title, presence: { message: 'required.' }
    validates :content, presence: { message: 'required.' }
end
