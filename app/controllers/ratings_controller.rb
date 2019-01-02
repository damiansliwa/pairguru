class RatingsController < ApplicationController
  def index
  	@users_with_most_comments = User.joins(:comments)
  									.group('comments.user_id')
  									.having('comments.created_at >= ?', 7.days.ago)
  									.order('COUNT(comments.id) DESC')
  									.limit(10)
  end
end
