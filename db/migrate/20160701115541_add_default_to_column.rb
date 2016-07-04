class AddDefaultToColumn < ActiveRecord::Migration
	def change
		change_column_default :urls, :count, 0
	end
end
