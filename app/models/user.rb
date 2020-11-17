#Jean-Yves Denoncourt 9977949   2020/11/13

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  # Relations
  has_many :recettes

  # Validations
  #validates :nom, :prenom, presence: true

  
  #def fullname
  #  nom + " , " + prenom
  #end
end
