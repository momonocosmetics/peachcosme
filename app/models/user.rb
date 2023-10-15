class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cosmetics, dependent: :destroy
    validates :name, presence: true 
  validates :profile, length: { maximum: 200 }       

  has_many :plays, dependent: :destroy
  has_many :played_cosmetics, through: :plays, source: :cosmetic

  has_many :comments, dependent: :destroy

  def already_played?(cosmetic)
    self.plays.exists?(cosmetic_id: cosmetic.id)
  end

  

end
