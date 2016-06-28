class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	before_save :shorten

	def shorten
		rnumbers = []
		8.times { rnumbers << rand(1..9) }
		self.short_url = rnumbers.join.to_i.to_s(36)
	end
end

