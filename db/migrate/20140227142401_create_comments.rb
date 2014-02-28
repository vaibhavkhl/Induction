class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :update_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
    add_index :comments, [:update_id, :user_id]
  end
end
