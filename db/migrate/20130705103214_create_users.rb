class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |user|
      user.string :username
      user.string :password_hash

      user.timestamps
    end
  end
end
