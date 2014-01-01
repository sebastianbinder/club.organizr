class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :customers_users
  has_many :customers, through: :customers_users
  
  has_many :events_users
  has_many :events, through: :events_users
  

  validates :firstname, :presence => true
  
  validates :lastname, :presence => true
  


end
