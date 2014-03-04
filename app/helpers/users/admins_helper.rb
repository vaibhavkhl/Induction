module Users::AdminsHelper
	def get_mentees
		p "inside get mentees"
		users = User.all
		users.select { |user| user.mentors.count > 0 }
	end
end