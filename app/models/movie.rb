class Movie < ActiveRecord::Base
	validates :title, :description, :year_released, presence: true
	validates :description, length: { minimum: 10 }

	def self.search_for(query)
		Movie.where("title LIKE :query OR description LIKE :query", {:query => "%#{query}%"})
	end
end
