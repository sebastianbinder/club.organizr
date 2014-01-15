class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
         
  has_many :customers_users
  has_many :customers, through: :customers_users
  
  has_many :events_users
  has_many :events, through: :events_users
  

  validates :firstname, :presence => true
  
  validates :lastname, :presence => true
  
  validates :password, presence: true, on: :create
  validates :password, presence: true, allow_blank: true, on: :update
  
  acts_as_messageable
 
  # Returns the name of the user
  def name
   return "#{first_name} #{last_name}"
  end
  
  # Returns the name of the user
  def sendmail(object)
   email
  end
  

  
end
