class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.integer :dog_id
      t.integer :member_id
      t.integer :foster_id

      t.timestamps
    end
  end
end
