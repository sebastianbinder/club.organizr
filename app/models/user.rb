class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :customer_users
  has_many :customers, through: :customer_users
  
  
  has_and_belongs_to_many :events

  validates :firstname, :presence => true
  
  validates :lastname, :presence => true
  


end
