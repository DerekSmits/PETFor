class Post < ApplicationRecord
    belongs_to :user, class_name: :User, foreign_key: :author_id
    validates :title, :body, presence: true
    resourcify
end
