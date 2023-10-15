class CosmeticTagRelation < ApplicationRecord
  belongs_to :cosmetic
  belongs_to :tag
end
