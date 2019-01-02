class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :movie, optional: true
  validates :text, :movie, :user, presence: true
  validates :user_id, uniqueness: { scope: :movie_id }
end
