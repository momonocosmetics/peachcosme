class Cosmetic < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user 

    has_many :plays, dependent: :destroy
    has_many :played_users, through: :plays, source: :user

    has_many :comments, dependent: :destroy
    has_many :cosmetic_tag_relations, dependent: :destroy
    has_many :tags, through: :cosmetic_tag_relations, dependent: :destroy

end
