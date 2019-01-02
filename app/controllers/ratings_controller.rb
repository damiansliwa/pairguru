class RatingsController < ApplicationController
  def index
  	commenters_count = 10
  	days_range = 7
  	@users_with_most_comments = User.joins(:comments)
  									.group('comments.user_id')
  									.having('comments.created_at >= ?', days_range.days.ago)
  									.order('COUNT(comments.id) DESC')
  									.limit(commenters_count)
  end
end
