class Users::AssociatesController <  ApplicationController
	before_filter :authenticate_user!
	authorize_resource class: User
	
	def associate_home
		@update = current_user.updates.build
		@comment = current_user.comments.build
        if current_user.mentors.empty?
            @previous_updates= current_user.mentees.first.updates    
        else
		    @previous_updates = current_user.updates
        end
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
