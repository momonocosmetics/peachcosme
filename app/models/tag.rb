class Tag < ApplicationRecord
    validates :name, presence: true
    has_many :cosmetic_tag_relations, dependent: :destroy
    has_many :cosmetics, through: :cosmetic_tag_relations, dependent: :destroy


end
