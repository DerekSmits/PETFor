class Post < ApplicationRecord
    validates :title, :text, :author, presence: true
end
