class UpdatesController < ApplicationController
  def create
    @update = current_user.updates.build(update_params)
    if @update.save
      flash.now[:success] = "Your update received" 
    else
      flash[:error] = "Some error occured."
    end
      redirect_to associate_path
  end	
  private
    
    def update_params
	    params.require(:update).permit(:content)
    end
end