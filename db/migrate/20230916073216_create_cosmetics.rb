class CreateCosmetics < ActiveRecord::Migration[6.1]
  def change
    create_table :cosmetics do |t|
      t.string :name
      t.integer :cost
      t.string :nayami
      t.string :image
      t.text :about
      t.string :genre
      t.integer :user_id

      t.timestamps
    end
  end
end
