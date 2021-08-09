class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :foster_id
      t.string :area
      t.text :introduction
      t.string :image_id
      t.string :dog_breed

      t.timestamps
    end
  end
end
