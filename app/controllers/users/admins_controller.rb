class Users::AdminsController <  ApplicationController
	before_filter :authenticate_user!
	authorize_resource class: User
	
	def admin_home
		@users = User.all
		@roles = Role.all
    end

    def tag_mentor
    	@users = User.all
    end

    def tag_mentor_update
    	p "------ppppppppppppppppppp--#{params}"
    	mentee = User.find_by(id: params[:mentee_id])
    	mentor = User.find_by(id: params[:mentor_id])
    	mentee.mentors.clear
    	mentee.mentors << mentor
    	redirect_to tag_mentor_path
    end

    def edit_role
    	p "------ppppppppppppppppppp--#{params}"
    	user = User.find_by(id: params[:user_id])
    	role = Role.find_by(id: params[:role_id])
    	user.roles.clear
    	user.roles << role
    	redirect_to admin_path
    end
end