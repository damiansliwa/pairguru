namespace :user_comments do
  desc "Generate comments"
  task generate: :environment do
  	movies = Movie.all
  	User.all.each do |user|
  	  comments_count = rand(1..movies.size)
  	  movies = movies.first(comments_count)
  	  movies.each do |movie|
  	  	Comment.create(text: Faker::HarryPotter.quote, user_id: user.id, movie_id: movie.id)
  	  	p "#{movie.title} comment created for #{user.name}"
  	  end
  	end

  	p "All comments has been created."
  end
end