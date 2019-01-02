class RatingsController < ApplicationController
  def index
  	commenters_count = 10
  	days_range = 7
  	@users_with_most_comments = User.by_comments_count
  									.having('comments.created_at >= ?', days_range.days.ago)
  									.limit(commenters_count)
  end
end
