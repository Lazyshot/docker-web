class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.references :app
      t.references :host

      t.string :cid
      t.integer :port

      t.timestamps
    end

    add_index :containers, :app_id
    add_index :containers, :host_id
  end
end
