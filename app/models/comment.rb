class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :movie, optional: true
  validates :text, :movie, :user, presence: true
end
