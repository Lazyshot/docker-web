class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email

      t.boolean :flag_admin

      t.integer :max_containers, :default => 5

      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :failed_login_count
      t.integer :login_count
      t.datetime :last_request_at
      t.datetime :curent_login_at
      t.datetime :last_login_at

      t.timestamps
    end
  end
end
