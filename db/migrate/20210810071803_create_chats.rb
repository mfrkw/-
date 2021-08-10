class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :member_id
      t.integer :foster_id
      t.text :messeage

      t.timestamps
    end
  end
end
