class Play < ApplicationRecord
  belongs_to :cosmetic
  belongs_to :user

  

  validates_uniqueness_of :cosmetic_id, scope: :user_id

end
