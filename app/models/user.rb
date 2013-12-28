class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_and_belongs_to_many :events

  validates :firstname, :presence => true
  
  validates :lastname, :presence => true
  
  ROLES = %w[admin customer organizer member viewer]
  
  def roles=(roles)
  	self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
  	ROLES.reject do |r|
    	((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
	end
  end

  def is?(role)
  	roles.include?(role.to_s)
  end

end
