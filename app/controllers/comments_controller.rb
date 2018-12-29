class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@comment = Comment.new(comment_params)
  	if @comment.save
  	  redirect_to movie_path(params[:movie_id]), notice: 'Your comment has been succesfully saved.'
  	else
  	  redirect_to movie_path(params[:movie_id]), 
  	  		alert: 'Comment could not be save. Add some text or delete your previous comment on this movie.'
  	end
  end

  private

  def comment_params
  	params.require(:comment).permit(:text, :movie_id, :user_id)
  end
end
