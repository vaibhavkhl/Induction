class Update < ActiveRecord::Base
	#belongs_to :users
	default_scope -> { order('created_at DESC') }
	validates :user_id, :content, presence: true

	has_many :comments  
end
