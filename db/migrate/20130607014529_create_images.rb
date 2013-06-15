class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :id
      t.references :user
      t.boolean :is_public

      t.timestamps
    end
    add_index :images, :user_id
  end
end
