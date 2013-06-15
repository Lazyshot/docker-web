class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :github_url
      t.string :github_key, :null => true

      t.references :user
      t.references :image

      t.timestamps
    end

    add_index :apps, :user_id
    add_index :apps, :image_id
  end
end
