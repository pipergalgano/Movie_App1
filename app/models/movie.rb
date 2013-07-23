class Movie < ActiveRecord::Base
	validates :title, :description, :year_released, presence: true
	validates :description, length: { minimum: 10 }
	validates :year_released, format: {with: /(19|20)\d{2}/i }

	def self.search_for(query)
		Movie.where("title LIKE :query OR description LIKE :query", {:query => "%#{query}%"})
	end
end
