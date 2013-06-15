class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :ip
      t.integer :port

      t.integer :memory
      t.integer :vcpus

      t.timestamps
    end
  end
end
