class Users::AssociatesController <  ApplicationController
	before_filter :authenticate_user!
	authorize_resource class: User
	
	def associate_home
		@comment = current_user.comments.build
        if current_user.mentors.empty? && current_user.mentees.empty?
               
        elsif current_user.mentees.empty?
		    #@previous_updates = current_user.updates
            p "-------------------------inside mentee"
            mentee_home
        else
            mentor_home
        end
    end
    
    def mentee_home
        @update = Update.new(user_id: current_user)
        @previous_updates = current_user.updates
        render 'mentee_home'
    end

    def mentor_home
        render 'mentor_home'
    end
end
