class CreateCosmeticTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :cosmetic_tag_relations do |t|
      t.references :cosmetic, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
