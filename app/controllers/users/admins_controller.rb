class Users::AdminsController <  ApplicationController
	include Users::AdminsHelper
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
    	mentor = User.find_by(email: params[:email])
    	mentee.mentors.clear
    	mentee.mentors << mentor unless mentor.nil? 
    	redirect_to tag_mentor_path
    end

    def change_role
        @users = User.all
        @roles = Role.all
    end
    
    def edit_role
    	p "------ppppppppppppppppppp--#{params}"
    	user = User.find_by(id: params[:user_id])
    	role = Role.find_by(id: params[:role_id])
    	user.roles.clear
    	user.roles << role
    	redirect_to change_role_path
    end

    def import_users
        User.import_users(params[:file])
        flash[:success] = "Users uploaded"
        redirect_to admin_path
    end
    
    def edit_users
    end

    def destroy_user
        user = User.find_by(id: params[:user_id])
        user.delete
        flash.now[:success] = "User deleted"
        redirect_to admin_path
    end

    def view_mentees_updates
        @mentees = get_mentees
        @comment = current_user.comments.build
    end

    def email_updates
        email_add = params[:email]
        UserMailer.mentees_updates_email(email_add).deliver
        flash[:success] = "Successfully emailed"
        redirect_to mentees_updates_path 
    end
end