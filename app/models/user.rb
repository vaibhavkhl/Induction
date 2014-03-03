class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  has_and_belongs_to_many :mentors, class_name: "User", foreign_key: "mentee_id", join_table: "mentees_mentors", association_foreign_key: "mentor_id"
  has_and_belongs_to_many :mentees, class_name: "User", foreign_key: "mentor_id", join_table: "mentees_mentors", association_foreign_key: "mentee_id"
  
  has_many :updates
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  
  after_commit :assign_default_role, on: :create
  
  def assign_default_role
    Rails.logger.debug "------------------------"
    self.roles << Role.find_by(name: 'associate')
    #self.save 
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end       
end
