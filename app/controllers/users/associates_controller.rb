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
        p 'inside mentee home---------------------'
        @update = Update.new(user_id: current_user)
        @previous_updates = current_user.updates
        p "-----------------------#{@previous_updates.count}"
        render 'mentee_home'

    end

    def mentor_home
        @previous_updates = current_user.mentees.first.updates
        render 'mentor_home'
    end

    def create_update
    	@update = current_user.updates.build(update_params)
    	if @update.save
    	    flash[:success] = "Your update received" 
        else
        	flash[:error] = "error"
        end
        redirect_to associate_path
    end
    
    def create_comment
       update = Update.find_by(id: params[:update_id])
       #p "-------------#{update.content}"
       @comment = update.comments.build(content: params[:comment].require(:content), user: current_user)
       if @comment.save
    	    flash[:success] = "Comment saved" 
        else
        	flash[:error] = "error"
        end	
       redirect_to associate_path 
    end

private
    
    def update_params
	    params.require(:update).permit(:content)
    end
    
    def comment_params
    	params.require(:comment).permit(:content)
    end
end
