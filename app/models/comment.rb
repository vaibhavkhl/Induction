class Comment < ActiveRecord::Base
	belongs_to :update
	belongs_to :user
end
