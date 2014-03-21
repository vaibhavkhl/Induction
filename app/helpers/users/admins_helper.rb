module Users::AdminsHelper
  
  def get_mentees
	  users = User.all
	  users.select { |user| user.mentors.count > 0 }
  end
  
  def get_associates
    User.all.select { |user| user.has_role? :associate }
  end
  
  def get_user(user_id)
    User.find_by(id: user_id)    
  end
  
  def get_user_by_update_id(update_id)
    user_id = Update.find_by(id: update_id).user_id
    get_user(user_id)
  end
end