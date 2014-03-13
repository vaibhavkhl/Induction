class HomeController < ApplicationController
  def homepage
    if user_signed_in? 
      roles_homepage
    else 
      render 'welcome'
    end
  end

  def welcome
  end

  private

  def roles_homepage
    if current_user.has_role? :superadmin
    	redirect_to admin_path
    elsif current_user.has_role? :admin
      redirect_to admin_path
    else
    	redirect_to associate_path
    end
  end
end