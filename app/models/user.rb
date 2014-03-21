class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  has_and_belongs_to_many :mentors, class_name: "User", foreign_key: "mentee_id", join_table: "mentees_mentors", association_foreign_key: "mentor_id"
  has_and_belongs_to_many :mentees, class_name: "User", foreign_key: "mentor_id", join_table: "mentees_mentors", association_foreign_key: "mentee_id"
  
  has_many :updates
  has_many :comments, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing.jpg"

  after_commit :assign_default_role, on: :create
  
  def assign_default_role
    Rails.logger.debug "------------------------"
    Role.create(name: associate) if Role.find_by(name: 'associate').nil?
    self.roles << Role.find_by(name: 'associate') if self.roles.empty?
    #self.save! 
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end  

  def self.import_users(file)
    spreadsheet = Roo::Excelx.new(file.path, nil, :ignore)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = new
      product.attributes = row.to_hash
      product.save!
    end
  end     
end
