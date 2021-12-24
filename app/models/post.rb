class Post < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :global_search, against: :title
    belongs_to :user, class_name: :User, foreign_key: :author_id
    validates :title, :body, presence: true
    validates :images, blob: { content_type: :image }
    has_many :comments, dependent: :destroy 
    has_many_attached :images
    resourcify
    end
